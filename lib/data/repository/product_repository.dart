import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qr_example/data/model/network_error.dart';
import 'package:qr_example/data/model/product_repository_response.dart';

import '../model/product.dart';
import 'iproduct_repository.dart';

class ProductRepository extends IProductRepository {
  static const String _productKeyName = 'verifiedProducts';

  @override
  Future<List<Product>> fetchProduct() async {
    try {
      // Load the JSON data from the asset file
      String jsonString = await rootBundle.loadString('assets/products.json');

      // Decode the JSON data into a List<Product>
      List<dynamic> jsonList = json.decode(jsonString);
      List<Product> productList = jsonList.map((json) => Product.fromJson(json)).toList();

      return productList;
    } catch (e) {
      throw NetworkError('Error loading data from asset', '500');
    }
  }

  Future<List<Product>> getCachedProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedProductsString = prefs.getString(_productKeyName);

      if (cachedProductsString != null) {
        // Deserialize the JSON string to a List<Product>
        List<Product> cachedProducts =
            (json.decode(cachedProductsString) as List<dynamic>).map((json) => Product.fromJson(json)).toList();
        return cachedProducts;
      } else {
        return [];
      }
    } catch (e) {
      throw NetworkError('Error loading cached products', '500');
    }
  }

  @override
  Future<ProductRepositoryResponse> addProduct(String serialNo) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString = await rootBundle.loadString('assets/products.json');
      List<dynamic> jsonList = json.decode(jsonString);
      List<Product> productList = jsonList.map((json) => Product.fromJson(json)).toList();

      // Find the product with the given serialNo
      List<Product> matchingProducts = productList.where((product) => product.serialNo == serialNo).toList();

      if (matchingProducts.isNotEmpty) {
        // Load existing cached products
        String? cachedProductsString = prefs.getString(_productKeyName);
        List<Product> cachedProducts = [];

        if (cachedProductsString != null) {
          cachedProducts =
              (json.decode(cachedProductsString) as List<dynamic>).map((json) => Product.fromJson(json)).toList();
        }

        // Check if the product is not already in the cache
        bool isProductAlreadyCached = cachedProducts.any((product) => product.serialNo == serialNo);

        if (!isProductAlreadyCached) {
          // Cache the matching product
          // String matchingProductJson = json.encode(matchingProducts.map((product) => product.toJson()).toList());
          cachedProducts.add(matchingProducts[0]);
          prefs.setString(_productKeyName, json.encode(cachedProducts));
          return ProductRepositoryResponse.success(cachedProducts);
        } else {
          return ProductRepositoryResponse.error(NetworkError('Product is already exists', '2323'));
        }
      } else {
        return ProductRepositoryResponse.error(NetworkError('Product not found', '404'));
      }
    } catch (e) {
      return ProductRepositoryResponse.error(NetworkError('Error adding product', '500'));
    }
  }
}
