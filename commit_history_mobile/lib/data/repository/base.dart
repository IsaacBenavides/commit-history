import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  final String apiUrl = dotenv.get("API_URL");
  Map<String, String> get headers => _buildHeaders();

  Map<String, String> _buildHeaders() {
    final Map<String, String> headers = {"Content-Type": "application/json"};
    return headers;
  }

  Future<http.Response> get(String path, {bool? useFullUrl}) {
    String url = useFullUrl ?? true ? "$apiUrl$path" : path;
    return http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response('', 408);
      },
    );
  }

  Future<http.Response> post(String path, Map<String, dynamic> body) {
    return http.post(
      Uri.parse("$apiUrl$path"),
      body: jsonEncode(body),
      headers: headers,
    );
  }

  Future<http.Response> put(String path, Object? body) {
    return http.put(
      Uri.parse("$apiUrl$path"),
      body: jsonEncode(body),
      headers: headers,
    );
  }

  Future<http.Response> delete(String path) {
    return http.delete(Uri.parse("$apiUrl$path"), headers: headers);
  }

  Future<http.Response> patch(String path, Map<String, dynamic> body) {
    return http.patch(
      Uri.parse("$apiUrl$path"),
      body: jsonEncode(body),
      headers: headers,
    );
  }
}

class BaseRepository extends Api {}
