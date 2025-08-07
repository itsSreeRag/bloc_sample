part of 'cart_bloc.dart';

class CartState {}

class CartInitial extends CartState {}

class CartListState extends CartState {
  final List<ProductModel> cartList;

  CartListState({required this.cartList});
}
