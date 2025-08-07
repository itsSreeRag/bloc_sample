import 'package:bloc_sample/widgets/product_card/product_card.dart';
import 'package:bloc_sample/views/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_sample/controller/ecom_bloc/ecom_bloc.dart';

class ProductGridWiew extends StatelessWidget {
  const ProductGridWiew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcomBloc, EcomState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoadedState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .65,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final data = state.products[index];
              return InkWell(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: data),
                      ),
                    ),
                child: ProductCard(product: data),
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
