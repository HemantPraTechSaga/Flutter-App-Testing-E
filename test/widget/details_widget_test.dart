import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multidesk_app/screens/details_screen.dart';

// Widget tests for DetailsScreen
void main() {
  testWidgets('Sum calculation works', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DetailsScreen()));
    await tester.enterText(find.byKey(const Key('num1')), '5');
    await tester.enterText(find.byKey(const Key('num2')), '7');
    await tester.tap(find.text('Calculate Sum'));
    await tester.pump();
    expect(find.byKey(const Key('result')), findsOneWidget);
    expect(find.text('Sum: 12'), findsOneWidget);
  });

  testWidgets('Sum calculation with invalid input', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DetailsScreen()));
    await tester.enterText(find.byKey(const Key('num1')), 'abc');
    await tester.enterText(find.byKey(const Key('num2')), '2');
    await tester.tap(find.text('Calculate Sum'));
    await tester.pump();
    expect(find.text('Sum: 2'), findsOneWidget);
  });
}
