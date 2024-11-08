import 'package:flutter/material.dart';
import 'screens/menu.dart'; // Import menu.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuPage(), // Set home ke MenuPage dari menu.dart
    );
  }
}
