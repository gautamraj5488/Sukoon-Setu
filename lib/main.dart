import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/splash_screen.dart';
import 'package:sukoon_setu/screens/welcome_screen.dart';

void main() => runApp(const SukoonSetuApp());

class SukoonSetuApp extends StatelessWidget {
  const SukoonSetuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SukoonSetu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6F61)),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}