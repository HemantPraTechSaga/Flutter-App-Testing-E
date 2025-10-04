import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multidesk_app/utils/helpers.dart';

// Test addition function
void main() {
  test('add returns correct sum', () {
    expect(add(2, 3), 5);
    expect(add(-1, 1), 0);
    expect(add(0, 0), 0);
  });
}
