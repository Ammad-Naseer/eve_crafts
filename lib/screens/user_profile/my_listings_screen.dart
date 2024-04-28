import 'package:flutter/material.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of listings
    List<Listing> listings = [
      Listing(
        id: '1',
        title: 'Handmade Necklace',
        price: 25.0,
        imageUrl: 'assets/images/necklace.jpg',
      ),
      Listing(
        id: '2',
        title: 'Watercolor Painting',
        price: 40.0,
        imageUrl: 'assets/images/painting.jpg',
      ),
      // Add more listings as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Listings'),
      ),
      body: ListView.builder(
        itemCount: listings.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              listings[index].imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(listings[index].title),
            subtitle: Text('\$${listings[index].price.toString()}'),
            onTap: () {
              // TODO: Implement listing details/edit screen navigation
            },
          );
        },
      ),
    );
  }
}

class Listing {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  Listing({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}
