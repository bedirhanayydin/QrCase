// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'qr_scanner_bloc.dart';

@immutable
abstract class QrScannerState extends Equatable {
  const QrScannerState();
}

class QrScannerPageInitial extends QrScannerState {
  const QrScannerPageInitial();

  @override
  List<Object> get props => [];
}

class VerifiedProductLoading extends QrScannerState {
  const VerifiedProductLoading();

  @override
  List<Object> get props => [];
}

class ShowSuccessMessage extends QrScannerState {
  const ShowSuccessMessage();

  @override
  List<Object> get props => [];
}

class QrScannerError extends QrScannerState {
  final String message;
  const QrScannerError(this.message);

  @override
  List<Object> get props => [message];
}
