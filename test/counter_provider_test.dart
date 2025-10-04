import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multidesk_app/counter_provider.dart';

// Unit test for CounterProvider
void main() {
  test('Counter increments', () {
    final provider = CounterProvider();
    expect(provider.count, 0);
    provider.increment();
    expect(provider.count, 1);
  });
}
