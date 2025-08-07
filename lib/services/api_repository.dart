import 'dart:convert';
import 'dart:developer';

import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<List<ProductModel>> fetchProduct() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      switch (response.statusCode) {
        case 200:
          final Map<String, dynamic> jsonData = jsonDecode(response.body);
          final List<dynamic> data = jsonData['products'];
          return data.map((json) => ProductModel.fromJson(json)).toList();

        case 400:
          throw Exception('Bad request');
        case 401:
          throw Exception('Unauthorized');
        case 403:
          throw Exception('Forbidden');
        case 404:
          throw Exception('Not found');
        case 500:
          throw Exception('Internal server error');
        default:
          throw Exception('Failed to load products');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('API Error: ${e.toString()}');
    }
  }
}
