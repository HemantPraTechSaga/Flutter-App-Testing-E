import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_multidesk_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full navigation flow', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Home screen
    expect(find.text('Counter: 0'), findsOneWidget);

    // Increment
    await tester.tap(find.text('Increment'));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);

    // Navigate to Details
    await tester.tap(find.text('Go to Details'));
    await tester.pumpAndSettle();
    expect(find.text('This is the Details screen'), findsOneWidget);

    // Go back
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
