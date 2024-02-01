import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_example/data/model/network_error.dart';
import 'package:qr_example/data/model/product.dart';
import 'package:qr_example/data/repository/product_repository.dart';

part 'verified_product_event.dart';
part 'verified_product_state.dart';

class VerifiedProductBloc extends Bloc<VerifiedProductEvent, VerifiedProductState> {
  final ProductRepository _productRepository;
  VerifiedProductBloc(this._productRepository) : super(const VerifiedProductInitial()) {
    on<GetVerifiedProduct>((event, emit) => _getVerifiedProduct(emit));
    // on<AddVerifiedProduct>((event, emit) => _addVerifiedProduct(emit, event.serialNo));
  }

  Future<void> _getVerifiedProduct(Emitter<VerifiedProductState> emit) async {
    try {
      emit(const VerifiedProductLoading());
      final response = await _productRepository.getCachedProducts();
      emit(VerifiedProductLoadedWithCache(response));
    } on NetworkError catch (e) {
      emit(VerifiedProductError(e.message));
    }
  }

  // Future<void> _addVerifiedProduct(Emitter<VerifiedProductState> emit, String serialNo) async {
  //   try {
  //     emit(const VerifiedProductLoading());
  //     final response = await _productRepository.addProduct(serialNo);
  //     emit(VerifiedProductLoaded(response));
  //     emit(const ShowSuccessMessage());
  //   } on NetworkError catch (e) {
  //     emit(VerifiedProductError(e.message));
  //   }
  // }
}
