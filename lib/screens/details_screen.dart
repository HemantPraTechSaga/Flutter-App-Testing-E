import 'package:flutter/material.dart';
import '../utils/helpers.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  String result = '';

  void _calculateSum() {
    final n1 = int.tryParse(_num1.text) ?? 0;
    final n2 = int.tryParse(_num2.text) ?? 0;
    setState(() {
      result = 'Sum: ${add(n1, n2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              key: const Key('num1'),
              controller: _num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number 1'),
            ),
            TextField(
              key: const Key('num2'),
              controller: _num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number 2'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _calculateSum,
              child: const Text('Calculate Sum'),
            ),
            const SizedBox(height: 8),
            Text(result, key: const Key('result')),
          ],
        ),
      ),
    );
  }
}
