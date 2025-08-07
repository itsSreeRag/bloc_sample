part of 'ecom_bloc.dart';

class EcomState {}

final class ProductInitialState extends EcomState {}

final class ProductLoadingState extends EcomState {}

final class ProductLoadedState extends EcomState {
  final List<ProductModel> products;

  ProductLoadedState(this.products);
}

final class ProductError extends EcomState {
  final String error;

  ProductError(this.error);
}
