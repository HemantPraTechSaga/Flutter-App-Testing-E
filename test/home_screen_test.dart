import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_multidesk_app/home_screen.dart';
import 'package:flutter_multidesk_app/counter_provider.dart';

// Widget test for HomeScreen
void main() {
  testWidgets('Increment button updates counter', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    expect(find.text('Counter: 0'), findsOneWidget);
    await tester.tap(find.text('Increment'));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
