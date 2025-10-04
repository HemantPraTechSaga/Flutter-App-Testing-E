import 'package:flutter/material.dart';
import '../utils/helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  final TextEditingController _controller = TextEditingController();
  String? errorText;

  List<String> items = ['Apple', 'Banana', 'Orange'];

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _validateInput() {
    setState(() {
      errorText = validateText(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text',
                errorText: errorText,
              ),
              onChanged: (_) => _validateInput(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/details'),
              child: const Text('Go to Details'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('Go to About'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Fruits:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, i) => ListTile(title: Text(items[i])),
            ),
          ],
        ),
      ),
    );
  }
}
