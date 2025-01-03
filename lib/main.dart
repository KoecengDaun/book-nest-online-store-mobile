import 'package:flutter/material.dart';
// import 'screens/menu.dart'; // Import menu.dart
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child : MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.blue),
      ),
      home: const LoginPage(),
      ),
    );
  }
}
