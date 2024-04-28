import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example user data
    User user = User(
      name: 'John Doe',
      email: 'john@example.com',
      profileImage: 'assets/images/profile.jpg',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.profileImage),
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the edit profile screen
                Navigator.pushNamed(context, '/editProfile');
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String profileImage;

  User({
    required this.name,
    required this.email,
    required this.profileImage,
  });
}
