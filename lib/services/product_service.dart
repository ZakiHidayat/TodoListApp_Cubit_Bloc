import 'dart:convert';
import 'dart:developer';

import 'package:crud_todolist_cubit_bloc/config/api_config.dart';
import 'package:crud_todolist_cubit_bloc/models/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductService {
  ProductService._();

  static Future<List<Product>> fetchAllProducts() async {
    try {
      final url =
          Uri.parse('${ApiConfig.baseUrl}/${ApiConfig.productEndpoint}');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        final status = responseJson['status'];
        if (status == true) {
          List productsApi = responseJson['data'];
          List<Product> products = [];
          for (final json in productsApi) {
            products.add(Product.fromJson(json));
          }
          return products;
        } else {
          final message = responseJson['message'];
          throw Exception(message);
        }
      } else {
        throw Exception('Service not available');
      }
    } catch (_) {
      rethrow;
    }
  }

  static Future addProduct({
    required Product product,
  }) async {
    try {
      final url =
          Uri.parse('${ApiConfig.baseUrl}/${ApiConfig.productEndpoint}');
      final response = await http.post(url, body: jsonEncode(product), headers: ApiConfig.headers);
      log(jsonEncode(product));
      final result = _processApi(response);
      return result;
    } catch (_) {
      rethrow;
    }
  }

  static Future updateProduct({
    required Product product,
  }) async {
    try {
      final url = Uri.parse(
          '${ApiConfig.baseUrl}/${ApiConfig.productEndpoint}/${product.id}');
      final response = await http.put(url, body: jsonEncode(product), headers: ApiConfig.headers);
      final result = _processApi(response);
      return result;
    } catch (_) {
      rethrow;
    }
  }

  static Future deleteProduct({
    required Product product,
  }) async {
    try {
      final url = Uri.parse(
          '${ApiConfig.baseUrl}/${ApiConfig.productEndpoint}/${product.id}');
      final response = await http.delete(url);
      final result = _processApi(response);
      return result;
    } catch (_) {
      rethrow;
    }
  }

  static _processApi(http.Response response) {
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final status = responseJson['status'];
      final message = responseJson['message'];
      if (status == true) {
        return true;
      } else {
        log(response.body);
      }
    } else {
      log(response.body);
    }
  }
}
