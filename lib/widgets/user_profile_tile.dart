import 'package:flutter/material.dart';

class UserProfileTile extends StatelessWidget {
  final String name;
  final String email;
  final String profileImageUrl;
  final VoidCallback onTap;

  const UserProfileTile({
    super.key,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImageUrl),
      ),
      title: Text(name),
      subtitle: Text(email),
      onTap: onTap,
    );
  }
}
