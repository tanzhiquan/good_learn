import 'package:flutter/material.dart';
import 'package:hotapp/screens/auth_screen.dart';

// Main function to run the ECommerceApp widget
void main() => runApp(ECommerceApp());

// Main application widget
class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Title of the application
      title: 'E-commerce Demo',
      // Home screen of the application
      home: AuthScreen(), 
      // Hide the debug banner in release mode
      debugShowCheckedModeBanner: false,
    );
  }
}

