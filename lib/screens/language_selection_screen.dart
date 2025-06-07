import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/screens/personal_info_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const LanguageSelectionScreen({super.key, required this.onLocaleChange});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguageCode;

  final List<Map<String, String>> languages = [
    {'code': 'en', 'flag': '🇺🇸', 'label': 'English'},
    {'code': 'hi', 'flag': '🇮🇳', 'label': 'हिंदी'},
    {'code': 'mr', 'flag': '🇮🇳', 'label': 'मराठी'},
    {'code': 'bn', 'flag': '🇮🇳', 'label': 'বাংলা'},
    {'code': 'te', 'flag': '🇮🇳', 'label': 'తెలుగు'},
  ];

  final Map<String, String> continueTexts = {
    'en': 'Continue',
    'hi': 'आगे बढ़ें',
    'mr': 'पुढे चला',
    'bn': 'এগিয়ে যান',
    'te': 'ముందుకు సాగు',
  };

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      appBar: AppBar(
        title: Text(
          localizations.chooseLanguage,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const BackButton(),
        backgroundColor: const Color(0xFFFFF7F0),
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Icon(Icons.language, size: 60, color: Colors.deepOrange),
            const SizedBox(height: 20),
            Text(
              localizations.selectLanguage,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              localizations.languageServicePrompt,
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Language options
            ...languages.map(
              (lang) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguageCode = lang['code'];
                  });
                  widget.onLocaleChange(Locale(lang['code']!));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedLanguageCode == lang['code']
                          ? Colors.deepOrange
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(lang['flag']!, style: const TextStyle(fontSize: 20)),
                      const SizedBox(width: 12),
                      Text(
                        lang['label']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40), // replaces Spacer()
            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedLanguageCode == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalInfoScreen(
                              onLocaleChange: widget.onLocaleChange,
                            ),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  continueTexts[selectedLanguageCode] ?? "आगे बढ़ें",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Eglish
// Hindi
// Marathi
// Bengali
// Telugu
// Welcome screen -> Phone Number OTP registration -> Language Selection Page -> Personal Details Page(Without previous sergery) -> Home Page(Wo 4 options wala)
