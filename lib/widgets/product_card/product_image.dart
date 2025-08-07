import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String thumbnail;

  const ProductImage({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cream,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          thumbnail,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          loadingBuilder: (context, child, loading) {
            if (loading == null) return child;
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
          errorBuilder:
              (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image_outlined, color: AppColors.grey),
              ),
        ),
      ),
    );
  }
}
