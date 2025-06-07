import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sukoon_setu/screens/language_selection_screen.dart';

class PhoneOtpLoginPage extends StatefulWidget {
  final Function(Locale) onLocaleSelected;
  const PhoneOtpLoginPage({super.key, required this.onLocaleSelected});

  @override
  State<PhoneOtpLoginPage> createState() => _PhoneOtpLoginPageState();
}

class _PhoneOtpLoginPageState extends State<PhoneOtpLoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  String _otpCode = '';
  bool _otpSent = false;

  void _sendOtp() {
    setState(() {
      _otpSent = true;
    });
  }

  void _verifyOtp() {
    // Implement OTP verification logic here
    if (_otpCode.length == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LanguageSelectionScreen(onLocaleChange: widget.onLocaleSelected,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Icon(
                Icons.lock_outline,
                size: 60,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 20),
              const Text(
                'Login with Phone',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Secure and simple login experience',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: '+91 ',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              if (_otpSent) ...[
                const Text(
                  'Enter the 6-digit OTP sent to your phone',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Pinput(
                  length: 6,
                  onChanged: (value) => _otpCode = value,
                  defaultPinTheme: PinTheme(
                    width: 48,
                    height: 56,
                    textStyle: const TextStyle(fontSize: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],


              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _otpSent ? _verifyOtp : _sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _otpSent ? 'Verify OTP' : 'Send OTP',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const Spacer(),
              const Text(
                'Need help? Contact Support',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
