import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/language_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // top spacer

              // Main centered content
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF00AEEF),
                    child: Icon(Icons.favorite_border, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "SukoonSetu",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "डिजिटल मानसिक स्वास्थ्य प्लेटफ़ॉर्म",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "अंडरसर्व्ड पॉपुलेशन के लिए",
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      IconWithText(icon: Icons.shield_outlined, label: "सुरक्षित", color: Colors.blue),
                      IconWithText(icon: Icons.group_outlined, label: "समुदायिक", color: Colors.green),
                      IconWithText(icon: Icons.favorite_outline, label: "देखभाल", color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguageSelectionScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00AEEF),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "शुरू करें",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguageSelectionScreen(),
                          ),
                        );
                      },
                    child: const Text.rich(
                      TextSpan(
                        text: "पहले से खाता है? ",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "लॉगिन करें",
                            style: TextStyle(color: Color(0xFF00AEEF), fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Bottom-aligned line
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "आपकी मानसिक स्वास्थ्य यात्रा में आपका साथी",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const IconWithText({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}
