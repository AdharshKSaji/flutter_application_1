part of 'product_bloc.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  final List<Productmodel> productlist;
  ProductInitial({required this.productlist});
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Productmodel> productlist;
  ProductLoaded({required this.productlist});
}

class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
}
