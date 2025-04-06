import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final String consumerKey;
  final String consumerSecret;

  ApiService({
    required this.baseUrl,
    required this.consumerKey,
    required this.consumerSecret,
  });

  Map<String, String> _getAuthParams() {
    return {
      'consumer_key': consumerKey,
      'consumer_secret': consumerSecret,
    };
  }

  Future<List<dynamic>> fetchProducts() async {
    final uri = Uri.parse('$baseUrl/wp-json/wc/v3/products')
        .replace(queryParameters: _getAuthParams());
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    final uri = Uri.parse(
      '$baseUrl/wp-json/wc/v3/products/categories',
    ).replace(queryParameters: _getAuthParams());
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> fetchOrders() async {
    final uri = Uri.parse(
      '$baseUrl/wp-json/wc/v3/orders',
    ).replace(queryParameters: _getAuthParams());
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
