import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../constants/api_constants.dart';

class NetworkService {
  static Future<http.Response> get(String path) async {
    final url = Uri.parse('${ApiConstants.BASE_URL}$path');
    return await http.get(url);
  }

  static Future<http.Response> post(String path, {dynamic body}) async {
    final url = Uri.parse('${ApiConstants.BASE_URL}$path');
    return await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  static Future<http.Response> put(String path, {dynamic body}) async {
    final url = Uri.parse('${ApiConstants.BASE_URL}$path');
    return await http.put(url, body: body);
  }

  static Future<http.Response> delete(String path) async {
    final url = Uri.parse('${ApiConstants.BASE_URL}$path');
    return await http.delete(url);
  }
}
