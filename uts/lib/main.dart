import 'package:flutter/material.dart';
import 'landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white, // Set the primary color to white
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Set AppBar background to white
          titleTextStyle: TextStyle(
            color: Colors.black, // Change the AppBar title color to black for contrast
          ),
        ),
        // Optional: Set other UI elements to match your design
      ),
      home: const LandingPage(),
    );
  }
}
