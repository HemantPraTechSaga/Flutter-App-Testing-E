// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_multidesk_app/details_screen.dart';
import 'package:flutter_multidesk_app/screens/about_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:flutter_multidesk_app/counter_provider.dart';
import 'package:flutter_multidesk_app/home_screen.dart';
import 'package:flutter_multidesk_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const HomeScreen(),
        routes: {
          '/details': (context) => const DetailsScreen(),
          '/about': (context) => const AboutScreen(),
        },
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Counter: 0'), findsOneWidget);
    expect(find.text('Counter: 1'), findsNothing);

    // Tap the 'Increment' button and trigger a frame.
    await tester.tap(find.text('Increment'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Counter: 0'), findsNothing);
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
