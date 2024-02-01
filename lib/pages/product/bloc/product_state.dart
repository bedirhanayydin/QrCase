// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  const ProductLoading();

  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> product;

  const ProductLoaded(this.product);

  @override
  List<Object> get props => [Product];
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}

class VerifiedProductInitial extends ProductState {
  const VerifiedProductInitial();

  @override
  List<Object> get props => [];
}

class VerifiedProductLoading extends ProductState {
  const VerifiedProductLoading();

  @override
  List<Object> get props => [];
}

class VerifiedProductLoaded extends ProductState {
  final List<Product> verifiedProduct;

  const VerifiedProductLoaded(this.verifiedProduct);

  @override
  List<Object> get props => [Product];
}

class VerifiedProductError extends ProductState {
  final String message;
  const VerifiedProductError(this.message);

  @override
  List<Object> get props => [message];
}
