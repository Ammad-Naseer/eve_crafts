import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of items in the shopping cart
    List<CartItem> cartItems = [
      CartItem(
        id: '1',
        name: 'Handmade Bracelet',
        price: 20.0,
        quantity: 2,
        imageUrl: 'assets/images/bracelet.jpg',
      ),
      CartItem(
        id: '2',
        name: 'Painting Set',
        price: 30.0,
        quantity: 1,
        imageUrl: 'assets/images/painting_set.jpg',
      ),
      // Add more items as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              cartItems[index].imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(cartItems[index].name),
            subtitle: Text('\$${cartItems[index].price.toString()}'),
            trailing: Text('Quantity: ${cartItems[index].quantity.toString()}'),
            onTap: () {
              // TODO: Implement item details/edit screen navigation
            },
          );
        },
      ),
    );
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
