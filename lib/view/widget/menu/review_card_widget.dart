// review_card_widget.dart
import 'package:cano/data/model/users_review/users_review_info.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/utils/format_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/users_review/users_review_viewmodel.dart';

class ReviewCardWidget extends ConsumerWidget {
  final UsersReviewInfo review;
  final String userName;

  const ReviewCardWidget(
      {super.key, required this.review, required this.userName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasImages = review.imageUrls != null &&
        review.imageUrls!.isNotEmpty &&
        review.imageUrls!.any((url) => url.isNotEmpty);

    final String displayName =
        (review.memberName != null && review.memberName!.isNotEmpty)
            ? review.memberName!
            : 'Unknown';

    final String displayDate =
        (review.createdAt != null && review.createdAt!.isNotEmpty)
            ? extractDate(review.createdAt!)
            : 'Unknown Date';

    final String displayContents = review.contents ?? '';

    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 아바타, 유저 정보, 더보기 아이콘
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 유저 아바타
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Text(
                    displayName.isNotEmpty ? displayName[0] : 'U',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                // 유저 정보 (이름, 날짜, 별점)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        displayDate,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          review.score.toInt(),
                          (index) => const Icon(
                            Icons.star,
                            color: AppColors.star,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 더보기 아이콘

                review.memberName == userName
                    ? PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (String value) {
                          if (value == 'delete') {
                            ref
                                .read(usersReviewViewModelProvider.notifier)
                                .deleteMenu(review.id);
                            ref
                                .read(usersReviewViewModelProvider.notifier)
                                .fetchReviews(review.menuId);
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text(
                              '삭제',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                        color: Colors.white,
                      )
                    : SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 8),
            // 리뷰 텍스트
            Text(
              displayContents,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            // 리뷰 이미지 (있을 경우)
            if (hasImages) ...[
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: review.imageUrls!.length,
                  itemBuilder: (context, index) {
                    final imageUrl = review.imageUrls![index];
                    if (imageUrl.isEmpty) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey.shade300,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.star,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey.shade300,
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
