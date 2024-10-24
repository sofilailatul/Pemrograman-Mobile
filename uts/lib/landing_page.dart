import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Baseus',
          style: TextStyle(
            color: Colors.black, // macOS-like text color
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow for the AppBar
        centerTitle: true, // Center the title
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF5F7FA), // Light background
              Color(0xFFE9EBEE),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with shadow and soft edges
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Rounded corners for the logo
                  child: Image.asset(
                    'assets/logo.png', // Ensure your logo is in the assets folder
                    height: 120,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Main title with modern styling
              const Text(
                'World\'s No.1 In Retractable Products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
              
              const SizedBox(height: 15),
              
              // Subtitle with softer text and gray color
              const Text(
                'Explore our innovative products and services.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Modern button with macOS style
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded edges for macOS look
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.2),
                  side: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2, // Blue accent border for modern look
                  ),
                ),
                child: const Text(
                  'Go to Login Page',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent, // Accent color for text
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
