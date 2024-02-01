import 'package:qr_example/data/model/product_repository_response.dart';

import '../model/product.dart';

abstract class IProductRepository {
  Future<List<Product>> fetchProduct();
  Future<ProductRepositoryResponse> addProduct(String serialNo);
}
