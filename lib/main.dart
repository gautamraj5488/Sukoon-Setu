import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart'; // generated localization class import
import 'package:sukoon_setu/screens/splash_screen.dart';
import 'package:sukoon_setu/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,      // <- Apply light theme
      darkTheme: AppTheme.darkTheme,   // <- Apply dark theme
      themeMode: ThemeMode.system, 
      localizationsDelegates: const [
        AppLocalizations.delegate,  // <-- Use this instead of S.delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SplashScreen(
        onLocaleSelected: setLocale,
      ),
    );
  }
}
