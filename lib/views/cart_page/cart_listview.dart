
import 'package:bloc_sample/controller/cart_bloc/cart_bloc.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:bloc_sample/views/cart_page/cart_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListview extends StatelessWidget {
  const CartListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartListState) {
          return ListView.builder(
            itemCount: (state.cartList.length),
            itemBuilder: (context, index) {
              ProductModel item=state.cartList[index];
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: CartListviewItem(item:item,),
              );
            },
          );
        }
        return Center(
          child: Text('No Products'),
        );
      },
    );
  }
}
