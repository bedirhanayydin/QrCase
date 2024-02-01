import 'package:qr_example/data/model/network_error.dart';
import 'package:qr_example/data/model/product.dart';

class ProductRepositoryResponse {
  final List<Product>? products;
  final NetworkError? error;

  ProductRepositoryResponse({this.products, this.error});

  factory ProductRepositoryResponse.success(List<Product> products) {
    return ProductRepositoryResponse(products: products);
  }

  factory ProductRepositoryResponse.error(NetworkError error) {
    return ProductRepositoryResponse(error: error);
  }

  bool get isError => error != null;
}
