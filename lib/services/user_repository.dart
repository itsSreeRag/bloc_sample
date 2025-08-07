import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final _storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> fetchUser() async {
    final token = await _storage.read(key: 'accessToken');

    if (token == null) {
      throw Exception('No access token found');
    }

    final uri = Uri.parse('https://dummyjson.com/auth/me');

    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 401) {
      throw Exception('Token expired or unauthorized');
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}
