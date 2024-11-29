import 'dart:convert';

import 'package:cano/data/model/submit_review/review_info.dart';
import 'package:cano/data/repository/submit_review/submit_review_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/user_info/user_info.dart';
import '../../desginsystem/strings.dart';
import '../../utils/format_string.dart';
import '../../utils/image_utils.dart';

/// 리뷰 ViewModel
class ReviewViewModel extends StateNotifier<ReviewInfo> {
  ReviewViewModel._internal(
    super.state,
  );

  static final ReviewViewModel _instance = ReviewViewModel._internal(
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

  factory ReviewViewModel() {
    return _instance;
  }

  static final reviewRepository = SubmitReviewRepository();

  Future<bool> submitReview(int menuId) async {
    final jsonData = {
      AppStrings.scoreEng: state.score,
      AppStrings.contentsEng: state.contents,
      AppStrings.acidityEng: state.acidity == null
          ? null
          : intensityLevelToRequest(state.acidity!.description),
      AppStrings.bodyEng: state.body == null
          ? null
          : intensityLevelToRequest(state.body!.description),
      AppStrings.bitternessEng: state.bitterness == null
          ? null
          : intensityLevelToRequest(state.bitterness!.description),
      AppStrings.sweetnessEng: state.sweetness == null
          ? null
          : intensityLevelToRequest(state.sweetness!.description),
    };

    List<MultipartFile> imageFiles = [];

    if (state.images != null && state.images!.isNotEmpty) {
      for (String imagePath in state.images!) {
        final compressedBytes = await compressImageToByte(imagePath);
        final tempFile = await saveCompressedImage(compressedBytes);
        final multipartFile = await MultipartFile.fromFile(tempFile.path);
        imageFiles.add(multipartFile);
      }
    }

    print("리뷰 images : ${imageFiles}");

    final formData = FormData.fromMap({
      "dto": MultipartFile.fromString(
        jsonEncode(jsonData),
        contentType: DioMediaType.parse("application/json"),
      ),
      "images": imageFiles,
    });

    final isSuccess = await reviewRepository.submitReview(menuId, formData);
    if (isSuccess) _resetState();
    return isSuccess;
  }

  void _resetState() {
    state = ReviewInfo(
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

  void setAcidity(String description) {
    state = state.copyWith(acidity: Intensitylevel.fromString(description));
  }

  void setBody(String description) {
    state = state.copyWith(body: Intensitylevel.fromString(description));
  }

  void setBitterness(String description) {
    state = state.copyWith(bitterness: Intensitylevel.fromString(description));
  }

  void setSweetness(String description) {
    state = state.copyWith(sweetness: Intensitylevel.fromString(description));
  }

  void addAroma(String scent) {
    state = state.copyWith(aroma: [...state.aroma, Aroma.fromString(scent)]);
  }

  void toggleAroma(String scent) {
    final aromaToAdd = Aroma.fromString(scent);

    if (state.aroma.contains(aromaToAdd)) {
      state = state.copyWith(
        aroma: List.from(state.aroma)..remove(aromaToAdd),
      );
    } else {
      state = state.copyWith(
        aroma: [...state.aroma, aromaToAdd],
      );
    }
  }
}

final reviewViewModelProvider =
    StateNotifierProvider<ReviewViewModel, ReviewInfo>(
  (ref) => ReviewViewModel(),
);
