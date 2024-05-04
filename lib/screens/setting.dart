import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: const Text('Setting 1'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to Setting 1
              },
            ),
            ListTile(
              title: const Text('Setting 2'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to Setting 2
              },
            ),
            ListTile(
              title: const Text('Profile Picture'),
              trailing: const Icon(Icons.person),
              onTap: () {
                // Navigate to Profile Picture setting
              },
            ),
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () {
                // Perform logout action
              },
            ),
            // Add more settings here
          ],
        ).toList(),
      ),
    );
  }
}
