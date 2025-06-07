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
    HomeContentPage(),
    AdvicePage(),
    BooksPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFff6e40),
        unselectedItemColor: Colors.grey.shade600,
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

// This is your original home content extracted
class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.greeting,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          Text(
            localizations.howWasYourDay,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 30),
          Text(
            localizations.services,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
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
              _buildServiceCard(localizations.aboutUs, Icons.favorite),
              _buildServiceCard(
                localizations.adviceFromSetu,
                Icons.medication_liquid,
              ),
              _buildServiceCard(
                localizations.audioBooksStories,
                Icons.menu_book,
              ),
              _buildServiceCard(
                localizations.commonMentalHealth,
                Icons.psychology,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            localizations.tipOfTheDay,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFff6e40), Color(0xFFff8e53)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    localizations.deepBreathTip,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFff6e40),
                  ),
                  child: Text(localizations.doItNow),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // GridView.builder(
          //   shrinkWrap: true,
          //   physics:NeverScrollableScrollPhysics(), // so it doesn’t scroll independently inside another scroll view
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, // 2 columns
          //     crossAxisSpacing: 10, // horizontal spacing between items
          //     mainAxisSpacing: 10, // vertical spacing between items
          //     childAspectRatio:
          //         1.0, // width / height ratio of each grid item (adjust as needed)
          //   ),
          //   itemCount: 9, // or your list length
          //   itemBuilder: (context, index) {
          //     return Container(
          //       margin: EdgeInsets.all(12),
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //         border: Border.all(width: 1, color: Colors.deepPurple),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: const Color(0xFFff6e40)),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
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
    return Center(
      child: Text(
        localizations.adviceLabel,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Center(
      child: Text(
        localizations.booksLabel,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Center(
      child: Text(
        localizations.profileLabel,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
