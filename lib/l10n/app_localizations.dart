import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
    Locale('te')
  ];

  /// No description provided for @ccontinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get ccontinue;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfoTitle;

  /// No description provided for @tellUsAboutYou.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get tellUsAboutYou;

  /// No description provided for @helpUsServeBetter.
  ///
  /// In en, this message translates to:
  /// **'Your info helps us serve you better'**
  String get helpUsServeBetter;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguage;

  /// No description provided for @loginWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Login with Phone'**
  String get loginWithPhone;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhone;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'OTP has been sent to'**
  String get otpSentTo;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help? Contact support.'**
  String get needHelp;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @languageServicePrompt.
  ///
  /// In en, this message translates to:
  /// **'In which language would you like the service?'**
  String get languageServicePrompt;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get nameLabel;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHint;

  /// No description provided for @nameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameError;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age *'**
  String get ageLabel;

  /// No description provided for @ageHint.
  ///
  /// In en, this message translates to:
  /// **'25'**
  String get ageHint;

  /// No description provided for @ageError.
  ///
  /// In en, this message translates to:
  /// **'Please enter age'**
  String get ageError;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender *'**
  String get genderLabel;

  /// No description provided for @genderHint.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get genderHint;

  /// No description provided for @genderError.
  ///
  /// In en, this message translates to:
  /// **'Please select gender'**
  String get genderError;

  /// No description provided for @professionLabel.
  ///
  /// In en, this message translates to:
  /// **'Profession *'**
  String get professionLabel;

  /// No description provided for @professionHint.
  ///
  /// In en, this message translates to:
  /// **'Your work'**
  String get professionHint;

  /// No description provided for @professionError.
  ///
  /// In en, this message translates to:
  /// **'Please enter profession'**
  String get professionError;

  /// No description provided for @areaLabel.
  ///
  /// In en, this message translates to:
  /// **'Area *'**
  String get areaLabel;

  /// No description provided for @areaHint.
  ///
  /// In en, this message translates to:
  /// **'City/Village name'**
  String get areaHint;

  /// No description provided for @areaError.
  ///
  /// In en, this message translates to:
  /// **'Please enter area'**
  String get areaError;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightLabel;

  /// No description provided for @weightHint.
  ///
  /// In en, this message translates to:
  /// **'60'**
  String get weightHint;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get heightLabel;

  /// No description provided for @heightHint.
  ///
  /// In en, this message translates to:
  /// **'170'**
  String get heightHint;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello! 👋'**
  String get greeting;

  /// No description provided for @howWasYourDay.
  ///
  /// In en, this message translates to:
  /// **'How was your day today?'**
  String get howWasYourDay;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @adviceFromSetu.
  ///
  /// In en, this message translates to:
  /// **'Advice from Setu'**
  String get adviceFromSetu;

  /// No description provided for @audioBooksStories.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks/Stories'**
  String get audioBooksStories;

  /// No description provided for @commonMentalHealth.
  ///
  /// In en, this message translates to:
  /// **'Understand Common Conditions'**
  String get commonMentalHealth;

  /// No description provided for @thought.
  ///
  /// In en, this message translates to:
  /// **'Thought of the Day'**
  String get thought;

  /// No description provided for @deepBreathTip.
  ///
  /// In en, this message translates to:
  /// **'Take a deep breath\n5 minutes of practice reduces stress and calms the mind.'**
  String get deepBreathTip;

  /// No description provided for @doItNow.
  ///
  /// In en, this message translates to:
  /// **'Do it now'**
  String get doItNow;

  /// No description provided for @homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// No description provided for @adviceLabel.
  ///
  /// In en, this message translates to:
  /// **'Advice'**
  String get adviceLabel;

  /// No description provided for @booksLabel.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get booksLabel;

  /// No description provided for @profileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// No description provided for @thoughtOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Even the smallest step toward healing counts — walk gently but keep walking.'**
  String get thoughtOfTheDay;

  /// No description provided for @breathingTechniques.
  ///
  /// In en, this message translates to:
  /// **'Breathing Techniques'**
  String get breathingTechniques;

  /// No description provided for @audioBook1.
  ///
  /// In en, this message translates to:
  /// **'Life-Changing Motivational Stories'**
  String get audioBook1;

  /// No description provided for @audioBook2.
  ///
  /// In en, this message translates to:
  /// **'Rural India and Mental Health'**
  String get audioBook2;

  /// No description provided for @audioBook1Link.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?v=wsNW00J-IIQ'**
  String get audioBook1Link;

  /// No description provided for @audioBook2Link.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?v=EiOzFwjFZhQ'**
  String get audioBook2Link;

  /// No description provided for @yogaLink.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?pp=0gcJCdgAo7VqN5tD&v=W-e55pc4ZSk'**
  String get yogaLink;

  /// No description provided for @meditationLink.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?pp=0gcJCdgAo7VqN5tD&v=JuIeF8CMU5k'**
  String get meditationLink;

  /// No description provided for @breathingAnxietyWorry.
  ///
  /// In en, this message translates to:
  /// **'Inhale through your nose for 4 seconds\nHold for 7 seconds\nExhale slowly through your mouth for 8 seconds\nRepeat 4 cycles'**
  String get breathingAnxietyWorry;

  /// No description provided for @breathingAnger.
  ///
  /// In en, this message translates to:
  /// **'Inhale deeply through your nose\nExhale making a soft “hmmm” sound\nFocus on the vibration\nRepeat 5 to 10 times'**
  String get breathingAnger;

  /// No description provided for @breathingStressIrritation.
  ///
  /// In en, this message translates to:
  /// **'Close your right nostril with your thumb, inhale through the left\nClose your left nostril, open the right and exhale\nInhale through the right, close it, exhale through the left\nRepeat for 2 to 5 minutes'**
  String get breathingStressIrritation;

  /// No description provided for @breathingSadness.
  ///
  /// In en, this message translates to:
  /// **'Sit or lie with one hand on your belly\nInhale slowly through your nose, feel your belly rise\nExhale through your mouth, feel your belly fall\nRepeat for 3 to 5 minutes'**
  String get breathingSadness;

  /// No description provided for @breathingCalming.
  ///
  /// In en, this message translates to:
  /// **'Inhale through your nose for 4 seconds\nHold for 1 second\nExhale through your mouth for 4 seconds\nPause for 1 second\nRepeat 5 to 10 times'**
  String get breathingCalming;

  /// No description provided for @aboutUsContent.
  ///
  /// In en, this message translates to:
  /// **'Sukoon SETU is a simple, multilingual mental wellness app created especially for India’s underserved and rural communities. With tools rooted in science and culture, we offer breathing techniques, yoga, sound therapy, guided meditation, and mental health audiobooks — all crafted to help you regulate emotions and build inner calm.\nOur intelligent chatbot, SukoonSaathi, answers sensitive mental health questions with compassion and accuracy, using verified knowledge from Indian medical experts and WHO. You can also explore common mental health conditions in easy language, take a quiz to understand your emotional state, or receive a thoughtful reminder with our “Thought of the Day.”\nAccessible in Hindi, English, Marathi, Bengali, and Telugu, Sukoon SETU is your quiet companion on the journey to emotional well-being — because everyone deserves peace of mind.'**
  String get aboutUsContent;

  /// No description provided for @diabetes.
  ///
  /// In en, this message translates to:
  /// **'1. Diabetes\n\n🩺 What is Diabetes?\n\n• Diabetes is a long-term condition where your body has trouble using sugar (called glucose) from your food.\n• Normally, a hormone called insulin helps carry sugar from your blood into your body’s cells for energy.\n• In diabetes, your body either doesn\'t make enough insulin or doesn’t use it well, causing sugar to stay in your blood.\n• Too much sugar in the blood for a long time can harm your heart, kidneys, eyes, and nerves.\n⚠️ Common Symptoms (What People May Feel)\n• 🥵 Feeling very thirsty often: You may drink more water than usual and still feel dry.\n• 🚽 Frequent urination: You may go to the toilet more, especially at night.\n• 😴 Feeling tired all the time: You might feel sleepy or weak, even after resting.\n• 👀 Blurry vision: Your eyesight might suddenly seem less clear.\n• ⚖️ Losing weight without trying: This can happen even when you are eating well.\n• 🩹 Cuts that heal slowly: Small wounds or infections might take longer to get better.\n• 🦶 Numbness or tingling: You may feel pins and needles in your hands or feet.\n🧠 Why It Matters\n• Diabetes doesn\'t always show symptoms early, but over time it can cause serious health issues.\n• It increases your risk for heart problems, kidney failure, eye damage, and nerve pain.\n• If not treated, it may even lead to stroke or limb damage (requiring amputation in extreme cases).\n• The good news: with lifestyle changes and care, it can be managed well.\n✅ What You Can Do (Precautions and Home Care)\n🍽️ Eat Smarter\n• Avoid sugary snacks and soft drinks: These quickly raise your blood sugar.\n• Eat more vegetables, whole grains (like brown rice), and fresh fruits: They help control sugar levels.\n• Reduce oily and fried food: These can lead to weight gain and worsen blood sugar.\n• Don’t skip meals: Eating at regular times helps maintain balanced sugar levels.\n🏃 Stay Physically Active\n• Aim for at least 30 minutes of walking or light activity every day.\n• Simple activities like cleaning, playing with kids, or doing housework also help.\n• Physical movement helps your body use insulin better.\n📉 Manage Your Weight\n• Even small weight loss (like 5–10% of your body weight) can make a big difference in sugar control.\n• Obesity is a strong risk factor for type 2 diabetes.\n🧪 Monitor & Get Checked\n• Check your blood sugar if you are over 35, overweight, or if someone in your family has diabetes.\n• Early testing helps you take action before it becomes serious.\n🚭 Say No To...\n• Smoking: It worsens blood flow and can damage your organs faster.\n• Alcohol: It can increase or suddenly drop blood sugar, both of which are dangerous.\n• Sugary drinks: Switch to water, buttermilk, or unsweetened tea.\n🧘‍♀️ Mental and Emotional Care\n• Diabetes can be stressful. You might feel anxious or frustrated about lifestyle changes.\n• Talk to someone—friends, family, or a counselor. You\'re not alone.\n• Stress itself can raise blood sugar, so keeping calm really helps.\n📌 When to See a Doctor\n• If you notice symptoms mentioned above, especially blurred vision, tiredness, or frequent urination.\n• If you have wounds that don’t heal or numbness in hands/feet.\n• For regular sugar testing—even if you feel okay.\n'**
  String get diabetes;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en', 'hi', 'mr', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
    case 'mr': return AppLocalizationsMr();
    case 'te': return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
