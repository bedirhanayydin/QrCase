// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verified_product_bloc.dart';

abstract class VerifiedProductEvent {}

class GetVerifiedProduct extends VerifiedProductEvent {
  GetVerifiedProduct();
}

// class AddVerifiedProduct extends VerifiedProductEvent {
//   String serialNo;
//   AddVerifiedProduct(
//     this.serialNo,
//   );
// }
