import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_example/data/model/network_error.dart';
import 'package:qr_example/data/model/product.dart';
import 'package:qr_example/data/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(this._productRepository) : super(const ProductInitial()) {
    on<GetProduct>((event, emit) => _getProduct(emit));
  }

  Future<void> _getProduct(Emitter<ProductState> emit) async {
    try {
      emit(const ProductLoading());
      await Future.delayed(const Duration(seconds: 1));
      final response = await _productRepository.fetchProduct();
      emit(ProductLoaded(response));
    } on NetworkError catch (e) {
      emit(ProductError(e.message));
    }
  }
}
