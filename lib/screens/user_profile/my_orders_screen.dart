import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of orders
    List<Order> orders = [
      Order(
        id: '123456',
        date: '2024-04-25',
        total: 50.0,
        status: 'Delivered',
      ),
      Order(
        id: '789012',
        date: '2024-04-20',
        total: 30.0,
        status: 'Pending',
      ),
      // Add more orders as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order ID: ${orders[index].id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${orders[index].date}'),
                Text('Total: \$${orders[index].total.toString()}'),
                Text('Status: ${orders[index].status}'),
              ],
            ),
            onTap: () {
              // TODO: Implement order details screen navigation
            },
          );
        },
      ),
    );
  }
}

class Order {
  final String id;
  final String date;
  final double total;
  final String status;

  Order({
    required this.id,
    required this.date,
    required this.total,
    required this.status,
  });
}
