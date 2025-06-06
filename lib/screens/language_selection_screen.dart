import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/personal_info_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  final List<Map<String, String>> languages = [
    {'flag': '🇮🇳', 'label': 'हिंदी'},
    {'flag': '🇺🇸', 'label': 'English'},
    {'flag': '🇵🇰', 'label': 'اردو'},
    {'flag': '🇮🇳', 'label': 'ਪੰਜਾਬੀ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("भाषा चुनें",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: const BackButton(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(Icons.language, size: 60, color: Color(0xFF00AEEF)),
            const SizedBox(height: 20),
            const Text(
              "अपनी पसंदीदा भाषा चुनें",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "आपको किस भाषा में सेवा चाहिए?",
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...languages.map((lang) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedLanguage = lang['label'];
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedLanguage == lang['label'] ? const Color(0xFF00AEEF) : Colors.grey.shade300,
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
            )),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedLanguage == null ? null : () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfoScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00AEEF),
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "आगे बढ़ें",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
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
