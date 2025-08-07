part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddCartButtonPress extends CartEvent {
  final ProductModel newItem;

  AddCartButtonPress({required this.newItem});
}
