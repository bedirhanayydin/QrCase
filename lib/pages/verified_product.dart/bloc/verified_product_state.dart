// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verified_product_bloc.dart';

@immutable
abstract class VerifiedProductState extends Equatable {
  const VerifiedProductState();
}

class VerifiedProductInitial extends VerifiedProductState {
  const VerifiedProductInitial();

  @override
  List<Object> get props => [];
}

class VerifiedProductLoading extends VerifiedProductState {
  const VerifiedProductLoading();

  @override
  List<Object> get props => [];
}

class VerifiedProductLoaded extends VerifiedProductState {
  final List<Product> verifiedProduct;

  const VerifiedProductLoaded(this.verifiedProduct);

  @override
  List<Object> get props => [Product];
}

class VerifiedProductLoadedWithCache extends VerifiedProductState {
  final List<Product> cachedProducts;

  const VerifiedProductLoadedWithCache(this.cachedProducts);

  @override
  List<Object?> get props => [cachedProducts];
}

class ShowSuccessMessage extends VerifiedProductState {
  const ShowSuccessMessage();

  @override
  List<Object> get props => [];
}

class VerifiedProductError extends VerifiedProductState {
  final String message;
  const VerifiedProductError(this.message);

  @override
  List<Object> get props => [message];
}
