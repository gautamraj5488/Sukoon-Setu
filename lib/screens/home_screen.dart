import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const HomeScreen({Key? key, required this.onLocaleChange}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContentPage(),
    const AdvicePage(),
    const BooksPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: theme.colorScheme.surface, // instead of Colors.white
        selectedItemColor: theme.primaryColor, // instead of Color(0xFFff6e40)
        unselectedItemColor: Colors.grey.shade600, // can keep grey here or add to AppColors
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localizations.homeLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: localizations.adviceLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book),
            label: localizations.booksLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: localizations.profileLabel,
          ),
        ],
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.greeting,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor, // instead of Colors.deepOrange
            ),
          ),
          Text(
            localizations.howWasYourDay,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              color: theme.textTheme.bodyLarge!.color, // usually primary text color
            ),
          ),
          const SizedBox(height: 30),
          Text(
            localizations.services,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor, // instead of Colors.deepOrange
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildServiceCard(localizations.aboutUs, Icons.favorite, theme),
              _buildServiceCard(localizations.adviceFromSetu, Icons.medication_liquid, theme),
              _buildServiceCard(localizations.audioBooksStories, Icons.menu_book, theme),
              _buildServiceCard(localizations.commonMentalHealth, Icons.psychology, theme),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            localizations.tipOfTheDay,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor, // instead of Colors.deepOrange
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor, // use primary color for gradient start
                  theme.colorScheme.secondary, // use secondary color for gradient end
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    localizations.deepBreathTip,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // this can stay white or you can define in your theme
                    foregroundColor: theme.primaryColor, // button text/icon color
                  ),
                  child: Text(localizations.doItNow),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon, ThemeData theme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: theme.primaryColor), // instead of Color(0xFFff6e40)
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.textTheme.bodyLarge!.color, // instead of Colors.black87
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Text(
        localizations.adviceLabel,
        style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
      ),
    );
  }
}

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Text(
        localizations.booksLabel,
        style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Text(
        localizations.profileLabel,
        style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
      ),
    );
  }
}
