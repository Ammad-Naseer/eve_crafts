import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'YOUR_BASE_URL'; // Replace with your backend URL

  // Method to fetch all products
  Future<List<dynamic>> fetchAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Return list of products
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  // Method to fetch product details by ID
  Future<Map<String, dynamic>> fetchProductById(String productId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products/$productId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Return product details
      } else {
        throw Exception('Failed to fetch product details');
      }
    } catch (e) {
      print('Error fetching product details: $e');
      return {};
    }
  }
}
