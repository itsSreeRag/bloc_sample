import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsSection extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsSection({super.key, required this.product});

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text('$label:', style: TextStyle(color: Colors.grey[600]))),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Product Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _buildRow('Category', product.category),
        _buildRow('SKU', product.sku),
        _buildRow('Weight', '${product.weight} kg'),
        _buildRow('Dimensions',
            '${product.dimensions.width} × ${product.dimensions.height} × ${product.dimensions.depth} cm'),
        _buildRow('Minimum Order', '${product.minimumOrderQuantity}'),
      ],
    );
  }
}
