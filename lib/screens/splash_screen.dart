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
    final theme = Theme.of(context); // Get the current theme

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.self_improvement,
                    size: 80,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'SukoonSetu',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
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
