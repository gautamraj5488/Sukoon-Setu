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
    if (_otpCode.length == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguageSelectionScreen(
            onLocaleChange: widget.onLocaleSelected,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Icon(
                Icons.lock_outline,
                size: 60,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                'Login with Phone',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Secure and simple login experience',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: '+91 ',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              if (_otpSent) ...[
                Text(
                  'Enter the 6-digit OTP sent to your phone',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Pinput(
                  length: 6,
                  onChanged: (value) => _otpCode = value,
                  defaultPinTheme: PinTheme(
                    width: 48,
                    height: 56,
                    textStyle: theme.textTheme.titleLarge,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border.all(color: theme.colorScheme.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _otpSent ? _verifyOtp : _sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
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
              Text(
                'Need help? Contact Support',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
