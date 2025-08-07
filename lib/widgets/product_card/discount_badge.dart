import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';

class DiscountBadge extends StatelessWidget {
  final double discount;

  const DiscountBadge({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '-${discount.toInt()}%',
        style: TextStyle(
          color: AppColors.cream,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
