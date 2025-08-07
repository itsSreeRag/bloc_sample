import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductTitleBrand extends StatelessWidget {
  final String title;
  final String brand;

  const ProductTitleBrand({
    super.key,
    required this.title,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBrown,
          ),
        ),
        if (brand.isNotEmpty)
          Text(
            'Brand: $brand',
            style: TextStyle(fontSize: 16, color: AppColors.brown),
          ),
      ],
    );
  }
}
