import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final _storage = FlutterSecureStorage();

  Future<void> authenticate({
    required String username,
    required String password,
  }) async {
    Uri uri = Uri.parse('https://dummyjson.com/auth/login');

    final response = await http.post(
      uri,
      body: {'username': username, 'password': password},
    );

    switch (response.statusCode) {
      case 200:
        final data = jsonDecode(response.body);
        log(data['accessToken'].toString());

        await _storage.write(key: 'accessToken', value: data['accessToken']);
        await _storage.write(key: 'refreshToken', value: data['refreshToken']);

        return data;
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
        throw Exception('Failed to authenticate');
    }
  }

  Future<String?> getStoredToken() async {
    return await _storage.read(key: 'accessToken');
  }

  Future<void> clearToken() async {
    await _storage.deleteAll();
  }
}
