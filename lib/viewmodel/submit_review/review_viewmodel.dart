import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cano/data/model/submit_review/review_info.dart';
import 'package:cano/data/repository/submit_review/submit_review_repository.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../../desginsystem/strings.dart';
import '../../utils/image_utils.dart';

/// 리뷰 ViewModel
class ReviewViewModel extends StateNotifier<ReviewInfo> {
  final SubmitReviewRepository reviewRepository;

  ReviewViewModel({required this.reviewRepository})
      : super(
          ReviewInfo(
            id: 0,
            memberName: '',
            contents: '',
            score: 0.0,
            images: [],
            acidity: null,
            body: null,
            bitterness: null,
            sweetness: null,
            aroma: [],
            createdAt: DateTime.now(),
          ),
        );

  /// 리뷰 제출 메서드
  Future<bool> submitReview(ReviewInfo newReview) async {
    // DTO로 변환
    final jsonData = {
      "score": state.score,
      "contents": state.contents,
      "acidity": state.acidity?.value,
      "body": state.body?.value,
      "bitterness": state.bitterness?.value,
      "sweetness": state.sweetness?.value,
    };

    // print(state.acidity?.value);
    
    // 이미지 파일 처리 (여러 이미지 지원)
    List<MultipartFile> imageFiles = [];

    if (state.images != null && state.images!.isNotEmpty) {
      for (String imagePath in state.images!) {
        final compressedBytes = await compressImageToByte(imagePath);
        final tempFile = await saveCompressedImage(compressedBytes);

        if (tempFile != null) {
          final multipartFile = await MultipartFile.fromFile(tempFile.path);
          imageFiles.add(multipartFile);
        }
      }
    }

    final formData = FormData.fromMap({
      "dto": MultipartFile.fromString(
        jsonEncode(jsonData),
        contentType: DioMediaType.parse("application/json"),
      ),
      "images": imageFiles,
    });

    // API 호출
    final isSuccess = await reviewRepository.submitReview(formData);
    if (isSuccess) {
      resetState();
    }
    return isSuccess;
  }

  /// 상태 초기화 메서드
  void resetState() {
    state = ReviewInfo(
      id: 0,
      memberName: '',
      contents: '',
      score: 0.0,
      images: null,
      acidity: null,
      body: null,
      bitterness: null,
      sweetness: null,
      aroma: [],
      createdAt: DateTime.now(),
    );
  }

  /// 별점 설정 메서드
  void setScore(double score) {
    state = state.copyWith(score: score);
  }

  /// 리뷰 텍스트 설정
  void setContents(String contents) {
    state = state.copyWith(contents: contents);
  }

  /// 이미지 추가 메서드
  Future<void> addImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final updatedUrls = List<String>.from(state.images ?? [])
        ..add(pickedFile.path);
      state = state.copyWith(images: updatedUrls);
    }
  }

  /// 이미지 제거 메서드
  void removeImage(int index) {
    final updatedUrls = List<String>.from(state.images ?? [])..removeAt(index);
    state = state.copyWith(images: updatedUrls);
  }

  /// 산미 설정
  void setAcidity(IntensityLevel? acidity) {
    state = state.copyWith(acidity: acidity);
  }

  /// 바디감 설정
  void setBody(IntensityLevel? body) {
    state = state.copyWith(body: body);
  }

  /// 쓴맛 설정
  void setBitterness(IntensityLevel? bitterness) {
    state = state.copyWith(bitterness: bitterness);
  }

  /// 단맛 설정
  void setSweetness(IntensityLevel? sweetness) {
    state = state.copyWith(sweetness: sweetness);
  }

  /// Aroma 토글 메서드
  void toggleAroma(Aroma aroma) {
    final updatedAromas = List<Aroma>.from(state.aroma ?? []);
    if (updatedAromas.contains(aroma)) {
      updatedAromas.remove(aroma);
    } else {
      updatedAromas.add(aroma);
    }
    state = state.copyWith(aroma: updatedAromas);
  }
}

final dio = Dio();
final reviewRepository = SubmitReviewRepository();

final reviewViewModelProvider =
    StateNotifierProvider.autoDispose<ReviewViewModel, ReviewInfo>(
  (ref) => ReviewViewModel(reviewRepository: reviewRepository),
);
