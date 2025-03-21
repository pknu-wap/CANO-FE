import 'package:dio/dio.dart';

import '../data/repository/auth/auth_repository.dart';
import '../viewmodel/auth/cano_token_manager.dart';
import 'api/auth/cano_auth_api.dart';

class AuthInterceptor extends Interceptor {
  static final AuthInterceptor _instance = AuthInterceptor._internal();

  AuthInterceptor._internal();

  factory AuthInterceptor() {
    return _instance;
  }

  static final authApi = CanoAuthApi(Dio());
  static final tokenManager = CanoTokenManager();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final accessToken = await AuthRepository.tokenManager.getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
        handler.next(options);
      }
    } catch (e) {
      handler.reject(DioException(
        requestOptions: options,
        error: '카카오 Auhtroization 헤더 추가 실패 $e',
      ));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print(
          "진짜 리뷰 에러 code, data ${err.response?.statusCode} ${err.response?.data}");
      try {
        final refreshToken = await tokenManager.getRefreshToken();
        if (refreshToken != null) {
          final refreshToken = await tokenManager.getRefreshToken();
          final tokenResponse =
              await authApi.reissueAccessToken({"refreshToken": refreshToken!});
          final newAccessToken = tokenResponse.accessToken;
          final newRefreshToken = tokenResponse.refreshToken;

          print("새로운 Access Token 재발급 성공 - access Token: ${newAccessToken}");
          print("새로운 Refresh Token 재발급 성공 - refresh Token: ${newRefreshToken}");
          await tokenManager.saveAccessToken(newAccessToken);
          await tokenManager.saveRefreshToken(newRefreshToken);

          final options = err.requestOptions;
          final data = options.data;
          final newOptions = options.retryWith(
            data: data is FormData ? data.clone() : data,
          );

          newOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          final response = await Dio().fetch(newOptions);
          handler.resolve(response);
          return;
        }
      } catch (e) {
        handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: '토큰 재발급 실패: $e',
        ));
        return;
      }
    }

    handler.next(err);
  }
}

extension on RequestOptions {
  RequestOptions retryWith({
    Object? data,
  }) {
    return copyWith(
      extra: {
        ...extra,
      },
      data: data ?? this.data,
    );
  }
}
