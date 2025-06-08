import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const ProfilePage({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.profileLabel,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
              child: Icon(
                Icons.person,
                size: 50,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Baddie',
              style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                _LanguageButton(locale: const Locale('en'), label: '🇺🇸 English', onLocaleChange: onLocaleChange),
                _LanguageButton(locale: const Locale('hi'), label: '🇮🇳 हिंदी', onLocaleChange: onLocaleChange),
                _LanguageButton(locale: const Locale('mr'), label: '🇮🇳 मराठी', onLocaleChange: onLocaleChange),
                _LanguageButton(locale: const Locale('te'), label: '🇮🇳 తెలుగు', onLocaleChange: onLocaleChange),
                _LanguageButton(locale: const Locale('bn'), label: '🇮🇳 বাংলা', onLocaleChange: onLocaleChange),
              ],
            ),
            const Spacer(),
            Text(
              '“Take a deep breath.”',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final Locale locale;
  final String label;
  final Function(Locale) onLocaleChange;

  const _LanguageButton({
    required this.locale,
    required this.label,
    required this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: () => onLocaleChange(locale),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: theme.colorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Text(
        label,
        style: TextStyle(color: theme.colorScheme.primary),
      ),
    );
  }
}
