import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multidesk_app/screens/home_screen.dart';
import 'package:flutter_multidesk_app/screens/details_screen.dart';
import 'package:flutter_multidesk_app/screens/about_screen.dart';

// Widget tests for HomeScreen
void main() {
  testWidgets('Counter increments', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text('Counter: 0'), findsOneWidget);
    await tester.tap(find.text('Increment'));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);
  });

  testWidgets('ListView displays items', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('Orange'), findsOneWidget);
  });

  testWidgets('Navigation to Details and About', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const HomeScreen(),
        routes: {
          '/details': (context) => const DetailsScreen(),
          '/about': (context) => const AboutScreen(),
        },
      ),
    );
    await tester.tap(find.text('Go to Details'));
    await tester.pumpAndSettle();
    expect(find.text('Details'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Go to About'));
    await tester.pumpAndSettle();
    expect(find.text('About'), findsOneWidget);
  });
}
