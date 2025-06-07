import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/phone_otp_login_page.dart';

class WelcomeScreen extends StatelessWidget {
  final Function(Locale) onLocaleSelected;
  const WelcomeScreen({super.key, required this.onLocaleSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Icon(
              Icons.self_improvement,
              size: 60,
              color: Colors.deepOrange,
            ),
            const SizedBox(height: 20),
            const Text(
              'SukoonSetu',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Bridging Minds to Peace.\nDigital Mental Health Support for All.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneOtpLoginPage(onLocaleSelected: onLocaleSelected)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Already Registered? Login',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Your companion on your mental health journey',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}