import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_multidesk_app/main.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app navigation and UI flow', (tester) async {
    await tester.pumpWidget(const MyApp());

    // HomeScreen
    expect(find.text('Counter: 0'), findsOneWidget);

    // Counter increment
    await tester.tap(find.text('Increment'));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);

    // TextField validation
    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(find.text('Text cannot be empty'), findsOneWidget);

    // ListView items
    expect(find.text('Apple'), findsOneWidget);

    // Navigate to Details
    await tester.tap(find.text('Go to Details'));
    await tester.pumpAndSettle();
    expect(find.text('Details'), findsOneWidget);

    // DetailsScreen calculation
    await tester.enterText(find.byKey(const Key('num1')), '3');
    await tester.enterText(find.byKey(const Key('num2')), '4');
    await tester.tap(find.text('Calculate Sum'));
    await tester.pump();
    expect(find.text('Sum: 7'), findsOneWidget);

    // Go to About
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Go to About'));
    await tester.pumpAndSettle();
    expect(find.text('About'), findsOneWidget);
    expect(
      find.text('This is a simple Flutter app for testing.'),
      findsOneWidget,
    );
  });
}
