import 'package:flutter/material.dart';

class StockInfo extends StatelessWidget {
  final int stock;
  final String availability;

  const StockInfo({super.key, required this.stock, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: stock > 0 ? Colors.green[100] : Colors.red[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            availability,
            style: TextStyle(
              color: stock > 0 ? Colors.green[800] : Colors.red[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text('Stock: $stock', style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}
