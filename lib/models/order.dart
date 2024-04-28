//import 'package:flutter/material.dart';

class Order {
  final String id;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
  });
}

class OrderItem {
  final String productId;
  final String productName;
  final double price;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });
}
