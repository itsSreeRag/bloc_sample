import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';

class CartButton extends StatelessWidget {
  final ProductModel product;

  const CartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
          radius: 14,
          backgroundColor: AppColors.darkBrown,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.cream,
            size: 16,
          ),
        ),
      ),
    );
  }
}
