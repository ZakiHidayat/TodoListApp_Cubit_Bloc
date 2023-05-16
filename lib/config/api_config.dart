import 'dart:io';

abstract class ApiConfig {
  ApiConfig._();

  static const baseUrl = 'http://10.0.2.2:8000/api';
  static const productEndpoint = 'products';
  static const headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}
