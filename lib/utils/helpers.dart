// String validation: returns error if empty, null otherwise
String? validateText(String value) {
  if (value.trim().isEmpty) return 'Text cannot be empty';
  return null;
}

// Simple addition
int add(int a, int b) => a + b;

// String manipulation: reverse a string
String reverse(String s) => s.split('').reversed.join();
