import 'package:flutter/material.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of products
    List<Product> products = [
      Product(
        name: 'Handmade Bracelet',
        price: 20.0,
        imageUrl: 'assets/images/bracelet.jpg',
      ),
      Product(
        name: 'Painting Set',
        price: 30.0,
        imageUrl: 'assets/images/painting_set.jpg',
      ),
      Product(
        name: 'Knitting Yarn',
        price: 15.0,
        imageUrl: 'assets/images/knitting_yarn.jpg',
      ),
      // Add more products as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              products[index].imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toString()}'),
            onTap: () {
              // TODO: Implement product details screen navigation
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
