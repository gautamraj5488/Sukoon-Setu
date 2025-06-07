import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/home_screen.dart';
import 'package:sukoon_setu/screens/quiz_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const PersonalInfoScreen({super.key, required this.onLocaleChange});

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
    final localizations = AppLocalizations.of(context)!;

    final genders = [
      localizations.genderMale,
      localizations.genderFemale,
      localizations.genderOther,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      appBar: AppBar(
        title: Text(
          localizations.personalInfoTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF7F0),
        foregroundColor: Colors.black87,
        elevation: 0,
        leading: const BackButton(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.person_outline, size: 60, color: Colors.deepOrange),
              const SizedBox(height: 12),
              Text(
                localizations.tellUsAboutYou,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                localizations.helpUsServeBetter,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // Name
              TextFormField(
                controller: nameController,
                decoration: customInputDecoration(localizations.nameLabel, localizations.nameHint),
                validator: (value) => value!.isEmpty ? localizations.nameError : null,
              ),
              const SizedBox(height: 16),

              // Age + Gender
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration(localizations.ageLabel, localizations.ageHint),
                      validator: (value) => value!.isEmpty ? localizations.ageError : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: customInputDecoration(localizations.genderLabel, localizations.genderHint),
                      value: selectedGender,
                      items: genders.map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      )).toList(),
                      onChanged: (value) => setState(() => selectedGender = value),
                      validator: (value) => value == null ? localizations.genderError : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Profession
              TextFormField(
                controller: professionController,
                decoration: customInputDecoration(localizations.professionLabel, localizations.professionHint),
                validator: (value) => value!.isEmpty ? localizations.professionError : null,
              ),
              const SizedBox(height: 16),

              // Area
              TextFormField(
                controller: areaController,
                decoration: customInputDecoration(localizations.areaLabel, localizations.areaHint),
                validator: (value) => value!.isEmpty ? localizations.areaError : null,
              ),
              const SizedBox(height: 16),

              // Weight + Height
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration(localizations.weightLabel, localizations.weightHint),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration(localizations.heightLabel, localizations.heightHint),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Continue Button
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
                          builder: (context) => HomeScreen(onLocaleChange: widget.onLocaleChange),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    localizations.ccontinue,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
