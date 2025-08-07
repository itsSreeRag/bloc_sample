import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';

class PriceRatingRow extends StatelessWidget {
  final double price;
  final double discountPercentage;
  final double rating;

  const PriceRatingRow({
    super.key,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              ),
            ),
            if (discountPercentage > 0)
              Text(
                '$discountPercentage% off',
                style: const TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: AppColors.amber600, size: 20),
            const SizedBox(width: 4),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
