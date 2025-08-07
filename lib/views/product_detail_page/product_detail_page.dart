import 'package:bloc_sample/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';
import 'widgets/product_image_header.dart';
import 'widgets/product_title_brand.dart';
import 'widgets/price_rating_row.dart';
import 'widgets/stock_info.dart';
import 'widgets/product_description.dart';
import 'widgets/product_details_section.dart';
import 'widgets/tags_wrap.dart';
import 'widgets/warranty_shipping_info.dart';
import 'widgets/reviews_section.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(product.title),
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageHeader(thumbnail: product.thumbnail),
            const SizedBox(height: 20),
            ProductTitleBrand(title: product.title, brand: product.brand),
            const SizedBox(height: 16),
            PriceRatingRow(
              price: product.price,
              discountPercentage: product.discountPercentage,
              rating: product.rating,
            ),
            const SizedBox(height: 20),
            StockInfo(
              stock: product.stock,
              availability: product.availabilityStatus,
            ),
            const SizedBox(height: 24),
            ProductDescription(description: product.description),
            const SizedBox(height: 24),
            ProductDetailsSection(product: product),
            if (product.tags.isNotEmpty) ...[
              const SizedBox(height: 24),
              TagsWrap(tags: product.tags),
            ],
            const SizedBox(height: 24),
            WarrantyShippingInfo(
              warranty: product.warrantyInformation,
              shipping: product.shippingInformation,
            ),
            const SizedBox(height: 24),
            if (product.reviews.isNotEmpty)
              ReviewsSection(reviews: product.reviews),
          ],
        ),
      ),
    );
  }
}
