import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderService {
  final String baseUrl = 'YOUR_BASE_URL'; // Replace with your backend URL

  // Method to place an order
  Future<bool> placeOrder(Map<String, dynamic> orderData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/orders'),
        body: jsonEncode(orderData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return true; // Order placed successfully
      } else {
        return false; // Failed to place order
      }
    } catch (e) {
      print('Error placing order: $e');
      return false;
    }
  }

  // Method to fetch orders for a user
  Future<List<dynamic>> fetchOrdersForUser(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/orders?userId=$userId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Return list of orders
      } else {
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }
}
