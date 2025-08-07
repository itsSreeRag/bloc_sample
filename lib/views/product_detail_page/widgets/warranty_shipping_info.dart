import 'package:flutter/material.dart';

class WarrantyShippingInfo extends StatelessWidget {
  final String warranty;
  final String shipping;

  const WarrantyShippingInfo({
    super.key,
    required this.warranty,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const Icon(Icons.verified, color: Colors.green),
          title: Text('Warranty: $warranty'),
        ),
        ListTile(
          leading: const Icon(Icons.local_shipping, color: Colors.blue),
          title: Text('Shipping: $shipping'),
        ),
      ],
    );
  }
}