import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final originalPrice = (product.price /
            (1 - product.discountPercentage / 100))
        .toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.darkBrown,
          ),
        ),
        if (product.brand.isNotEmpty)
          Text(
            product.brand,
            style: TextStyle(color: AppColors.brown, fontSize: 11),
          ),
        const Spacer(),
        Row(
          children: [
            Icon(Icons.star_rounded, color: AppColors.amber600, size: 14),
            const SizedBox(width: 2),
            Text(
              product.rating.toStringAsFixed(1),
              style: TextStyle(fontSize: 11, color: AppColors.brown),
            ),
            const SizedBox(width: 4),
            Text(
              '(${product.reviews.length})',
              style: TextStyle(fontSize: 10, color: AppColors.brown),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '\$${product.price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBrown,
              ),
            ),
            if (product.discountPercentage > 0) ...[
              const SizedBox(width: 6),
              Text(
                '\$$originalPrice',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.brown,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
