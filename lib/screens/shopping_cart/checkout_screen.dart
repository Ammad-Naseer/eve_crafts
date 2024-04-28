import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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

    // Calculate total price
    double totalPrice = cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
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
                  trailing:
                      Text('Quantity: ${cartItems[index].quantity.toString()}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}', // Display total price
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement payment processing and order placement
              },
              child: const Text('Place Order'),
            ),
          ),
        ],
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
