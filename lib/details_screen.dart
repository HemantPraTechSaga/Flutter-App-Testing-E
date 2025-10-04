import 'package:flutter/material.dart';

// Details screen showing simple text
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('This is the Details screen')),
    );
  }
}
