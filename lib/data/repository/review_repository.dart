import 'package:shared_preferences/shared_preferences.dart';

class ReviewRepository {
  static final ReviewRepository _instance = ReviewRepository._internal();


  ReviewRepository._internal();

  factory ReviewRepository() {
    return _instance;
  }
  
  Future<void> addReview() async {}

  Future<void> updateReview() async {}

  Future<void> deleteReview() async {}

}