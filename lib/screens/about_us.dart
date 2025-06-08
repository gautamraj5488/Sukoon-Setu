import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App name or logo section
            Text(
              "🧘 Sukoon Sathi",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),

            // Tagline
            Text(
              "Your companion for mental peace and wellbeing.",
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              "We aim to make mental health support simple, accessible, and stigma-free. Sukoon Sathi provides personalized tools, audio stories, culturally relevant resources, and professional guidance to help you feel better — one step at a time.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),

            // Footer
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "© 2025 Sukoon Sathi • All rights reserved",
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
