import 'package:bloc_sample/constants/constants.dart';
import 'package:bloc_sample/views/home_screen/widgets/categories.dart';
import 'package:bloc_sample/views/home_screen/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.qr_code, size: 25),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search_rounded, size: 25),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBrown,
                  ),
                ),
                const SizedBox(height: 4),
                 Text(
                  'Best trendy collection!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                const Categories(),
                const SizedBox(height: 10),
                const ProductGridWiew(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
