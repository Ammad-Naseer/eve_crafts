import 'package:flutter/material.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Seller seller = Seller(
      name: 'Ammad Naseer',
      email: 'Ammad@evecraft.com',
      rating: 4.7,
      imageUrl: 'assets/hand-made.png',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(seller.imageUrl),
              ),
              const SizedBox(height: 20),
              Text(
                'Name: ${seller.name}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${seller.email}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Rating: ${seller.rating.toString()}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Seller {
  final String name;
  final String email;
  final double rating;
  final String imageUrl;

  Seller({
    required this.name,
    required this.email,
    required this.rating,
    required this.imageUrl,
  });
}
