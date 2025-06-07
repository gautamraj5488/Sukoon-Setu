import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) onLocaleSelected;
  const SplashScreen({super.key, required this.onLocaleSelected});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(onLocaleSelected: widget.onLocaleSelected),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.self_improvement,
                    size: 80,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'SukoonSetu',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}