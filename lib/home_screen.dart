import 'package:flutter/material.dart';
import 'details_screen.dart';

// Home screen with local counter and navigation
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  final TextEditingController _controller = TextEditingController();
  String? errorText;

  void _validateInput(String value) {
    setState(() {
      errorText = value.trim().isEmpty ? 'Text cannot be empty' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('Increment'),
            ),
            const SizedBox(height: 16),
            // Add TextField with validation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  errorText: errorText,
                ),
                onChanged: _validateInput,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              child: const Text('Go to Details'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Go to About'),
            ),
          ],
        ),
      ),
    );
  }
}
