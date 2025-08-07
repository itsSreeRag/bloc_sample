import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductImageHeader extends StatelessWidget {
  final String thumbnail;

  const ProductImageHeader({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cream,
        ),
        child:
            thumbnail.isNotEmpty
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported, size: 50),
                  ),
                )
                : Icon(Icons.image, size: 50, color: AppColors.grey),
      ),
    );
  }
}
