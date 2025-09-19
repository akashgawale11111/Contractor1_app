import 'package:contractor_app/language/lib/l10n/language_provider.dart';
import 'package:contractor_app/language/lib/l10n/app_localizations.dart';
import 'package:contractor_app/theme/theme_provider.dart';
import 'package:contractor_app/ui_screens/home/face_detection.dart/face_detection.dart';
import 'package:contractor_app/ui_screens/home/map_screen/map2.dart';
import 'package:contractor_app/ui_screens/profile_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [const HomeScreen(), const ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      // AppDrawer is now a ConsumerWidget, so it can access ref if needed.
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context).home,
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        elevation: 0,
        leading: Builder(builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: isDarkMode ? Colors.white : Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context).profile,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> projects = const [
    {
      "title": "Residential Tower – Masonry Work",
      "address":
          "12, 6th floor, Asha building, Tidake colony, near Real Durvankar lawns, Nashik, Maharashtra - 422009",
      "image":
          "assets/images/Elevation1.png", // Replace with your image URL or asset
    },
    {
      "title": "Residential Tower – Masonry Work",
      "address":
          "12, 6th floor, Asha building, Tidake colony, near Real Durvankar lawns, Nashik, Maharashtra - 422009",
      "image":
          "assets/images/Elevation1.png", // Replace with your image URL or asset
    },
    {
      "title": "Residential Tower – Masonry Work",
      "address":
          "12, 6th floor, Asha building, Tidake colony, near Real Durvankar lawns, Nashik, Maharashtra - 422009",
      "image":
          "assets/images/Elevation1.png", // Replace with your image URL or asset
    },
    {
      "title": "Residential Tower – Masonry Work",
      "address":
          "12, 6th floor, Asha building, Tidake colony, near Real Durvankar lawns, Nashik, Maharashtra - 422009",
      "image":
          "assets/images/Elevation1.png", // Replace with your image URL or asset
    },
    // Add more project maps if needed
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the localeProvider to ensure HomeScreen rebuilds when locale changes
    ref.watch(localeProvider);
    final localizations = AppLocalizations.of(context);

    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    projects[index]['image']!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations.projectTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                localizations.projectAddress,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (_) => const AttendanceScreen(),
                            //       ),
                            //     );
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: Colors.orange,
                            //     padding: const EdgeInsets.symmetric(
                            //       horizontal: 15,
                            //     ),
                            //   ),
                            //   child: Text(localizations.punchIn),
                            // ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> AttendanceScreen()));
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              child: Text(localizations.punchIn),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> FaceVerificationScreen()));
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              child: Text(localizations.punchOut),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final localizations = AppLocalizations.of(context);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Drawer(
      child: Builder(
        builder: (context) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(localizations.changeLanguage),
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (dialogContext) => AlertDialog(
                          title: Text(
                            AppLocalizations.of(dialogContext).selectLanguage,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                  title: const Text('English'),
                                  onTap: () {
                                    Navigator.pop(context); // Close drawer & dialog
                                    ref.read(localeProvider.notifier).setLocale(const Locale('en'));
                                  },
                                ),
                              ListTile(
                                  title: const Text('हिंदी'),
                                  onTap: () {
                                    Navigator.pop(context); // Close drawer & dialog
                                    ref.read(localeProvider.notifier).setLocale(const Locale('hi'));
                                  },
                                ),
                              ListTile(
                                  title: const Text('मराठी'),
                                  onTap: () {
                                    Navigator.pop(context); // Close drawer & dialog
                                    ref.read(localeProvider.notifier).setLocale(const Locale('mr'));
                                  },
                                ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: Text(
                                AppLocalizations.of(dialogContext).cancel,
                              ),
                            ),
                          ],
                        ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: Text(localizations.paymentHistory),
                onTap: () {
                  /* Handle settings tap */
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: Text(localizations.paymentHistory),
                onTap: () {
                  /* Handle settings tap */
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(localizations.logout),
                onTap: () => Navigator.pop(context),
              ),
            ],
          );
        },
      ),
    );
  }
}
