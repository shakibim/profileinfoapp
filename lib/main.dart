import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() => runApp(const MaterialApp(home: ProfileScreen()));

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(child: ProfileCard()),
    );
  }
}