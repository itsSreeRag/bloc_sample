import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:flutter/material.dart';
import 'review_card.dart';

class ReviewsSection extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsSection({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Customer Reviews',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...reviews.map((review) => ReviewCard(review: review)),
      ],
    );
  }
}
