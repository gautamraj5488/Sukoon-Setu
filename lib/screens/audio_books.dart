import 'package:flutter/material.dart';

class AudioBooksPage extends StatelessWidget {
  const AudioBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final audioBooks = [
      {'title': 'Mindful Moments', 'icon': Icons.self_improvement},
      {'title': 'Healing Waves', 'icon': Icons.spa},
      {'title': 'Calm Nights', 'icon': Icons.nightlight_round},
      {'title': 'Inner Peace', 'icon': Icons.emoji_nature},
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          'AudioBooks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: audioBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final book = audioBooks[index];

            return Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 1.2,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    book['icon'] as IconData,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    book["title"] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
