// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'qr_scanner_bloc.dart';

abstract class QrScannerEvent {}

class AddVerifiedProduct extends QrScannerEvent {
  String serialNo;
  AddVerifiedProduct(
    this.serialNo,
  );
}
