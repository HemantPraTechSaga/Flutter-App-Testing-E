import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const MyApp());
}

// Root widget with named routes
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test App',
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
