import 'package:flutter/material.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/quiz_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String? selectedGender;
  final List<String> genders = ['पुरुष', 'महिला', 'अन्य'];

  InputDecoration customInputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("व्यक्तिगत जानकारी", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.person_outline, size: 60, color: Color(0xFF00AEEF)),
              const SizedBox(height: 12),
              const Text(
                "अपने बारे में बताएं",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "बेहतर सेवा के लिए आपकी जानकारी",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // नाम
              TextFormField(
                controller: nameController,
                decoration: customInputDecoration("नाम *", "अपना नाम लिखें"),
                validator: (value) => value!.isEmpty ? "कृपया नाम भरें" : null,
              ),
              const SizedBox(height: 16),

              // उम्र और लिंग
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("उम्र *", "25"),
                      validator: (value) => value!.isEmpty ? "उम्र भरें" : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: customInputDecoration("लिंग *", "चुनें"),
                      value: selectedGender,
                      items: genders
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() => selectedGender = value),
                      validator: (value) => value == null ? "चुनें" : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // पेशा
              TextFormField(
                controller: professionController,
                decoration: customInputDecoration("पेशा *", "आपका काम"),
                validator: (value) => value!.isEmpty ? "पेशा भरें" : null,
              ),
              const SizedBox(height: 16),

              // इलाका
              TextFormField(
                controller: areaController,
                decoration: customInputDecoration("इलाका *", "शहर/गाँव का नाम"),
                validator: (value) => value!.isEmpty ? "इलाका भरें" : null,
              ),
              const SizedBox(height: 16),

              // वजन और कद
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("वजन (kg)", "60"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("कद (cm)", "170"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final userInfo = UserInfo(
                        name: nameController.text.trim(),
                        age: int.parse(ageController.text.trim()),
                        gender: selectedGender!,
                        profession: professionController.text.trim(),
                        area: areaController.text.trim(),
                        weight: weightController.text.trim().isEmpty
                            ? null
                            : double.tryParse(weightController.text.trim()),
                        height: heightController.text.trim().isEmpty
                            ? null
                            : double.tryParse(heightController.text.trim()),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(userInfo: userInfo),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00AEEF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "आगे बढ़ें",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
