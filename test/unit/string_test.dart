import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multidesk_app/utils/helpers.dart';

// Test string validation and manipulation
void main() {
  test('validateText returns error for empty', () {
    expect(validateText(''), 'Text cannot be empty');
    expect(validateText('   '), 'Text cannot be empty');
  });

  test('validateText returns null for non-empty', () {
    expect(validateText('hello'), null);
  });

  test('reverse reverses string', () {
    expect(reverse('abc'), 'cba');
    expect(reverse(''), '');
  });
}
