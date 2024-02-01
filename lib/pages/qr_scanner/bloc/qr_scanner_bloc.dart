import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_example/data/model/network_error.dart';
import 'package:qr_example/data/repository/product_repository.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  final ProductRepository _productRepository;
  QrScannerBloc(this._productRepository) : super(const QrScannerPageInitial()) {
    on<AddVerifiedProduct>((event, emit) => _addQrScanner(emit, event.serialNo));
  }

  Future<void> _addQrScanner(Emitter<QrScannerState> emit, String serialNo) async {
    try {
      emit(const VerifiedProductLoading());
      final response = await _productRepository.addProduct(serialNo);
      if (response.isError) {
        emit(const QrScannerError("Lütfen tekrar deneyiniz!"));
      } else {
        emit(const ShowSuccessMessage());
      }
    } on NetworkError catch (e) {
      emit(QrScannerError(e.message));
    }
  }
}
