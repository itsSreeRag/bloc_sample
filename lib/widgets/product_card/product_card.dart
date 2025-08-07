import 'package:bloc_sample/constants/constants.dart';
import 'package:bloc_sample/widgets/product_card/cart_button.dart';
import 'package:bloc_sample/widgets/product_card/discount_badge.dart';
import 'package:bloc_sample/widgets/product_card/product_image.dart';
import 'package:bloc_sample/widgets/product_card/product_info.dart';
import 'package:flutter/material.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:bloc_sample/views/product_detail_page/product_detail_page.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.brown.withAlpha(50),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailPage(product: product),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image + Discount + Add-to-cart
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      ProductImage(thumbnail: product.thumbnail),
                      if (product.discountPercentage > 0)
                        DiscountBadge(discount: product.discountPercentage),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: CartButton(product: product),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Product Info
                Expanded(
                  flex: 2,
                  child: ProductInfo(product: product),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
