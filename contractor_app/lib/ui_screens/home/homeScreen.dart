import 'dart:io';

import 'package:contractor_app/language/lib/l10n/app_localizations.dart';
import 'package:contractor_app/language/lib/l10n/language_provider.dart';
import 'package:contractor_app/ui_screens/authentication/login/loginscreen.dart';
import 'package:contractor_app/ui_screens/home/face_detection.dart/face_detection.dart';
import 'package:contractor_app/ui_screens/menu_screens/attendance_calendar.dart';
import 'package:contractor_app/ui_screens/menu_screens/attendance_history.dart';
import 'package:contractor_app/ui_screens/menu_screens/navbar.dart';
import 'package:contractor_app/ui_screens/menu_screens/payment_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Logout popup function (localized)
void showLogoutPopup(BuildContext context) {
  final loc = AppLocalizations.of(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE990),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout, size: 40, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                loc.logoutConfirm,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Source Sans 3',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      loc.cancel,
                      style: const TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE85426),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      loc.logout,
                      style: const TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class HomeScreen extends ConsumerStatefulWidget {
  // Keep existing parameters for compatibility, but they will be ignored
  final String selectedLanguageCode;
  final Function(String) onLanguageChanged;

  const HomeScreen({
    super.key,
    this.selectedLanguageCode = 'en',
    this.onLanguageChanged = _noop,
  });

  static void _noop(String _) {}

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isPunchedIn = false;
  bool _isPunchedOut = false;

  // Language display names and their corresponding codes
  final Map<String, String> languageMap = const {
    'English': 'en',
    'Marathi': 'mr',
    'Hindi': 'hi',
  };

  final List<String> languages = const ['English', 'Marathi', 'Hindi'];

  String getLanguageFromCode(String code) {
    for (var entry in languageMap.entries) {
      if (entry.value == code) {
        return entry.key;
      }
    }
    return 'English'; // Default fallback
  }

  Future<bool> _onWillPop() async {
    exit(0);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final currentLocaleCode = ref.watch(localeProvider).languageCode;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            loc.home,
            style: const TextStyle(fontFamily: 'Source Sans 3'),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder:
                (BuildContext context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
          ),
        ),
        bottomNavigationBar: Navbar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFFE85426)),
                child: Text(
                  loc.menu,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Source Sans 3',
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(
                  '${loc.attendanceCalendar} >',
                  style: const TextStyle(fontFamily: 'Source Sans 3'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AttendenceCal(),
                    ),
                  );
                  // Navigate to attendance calendar
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: Text(
                  '${loc.paymentHistory} >',
                  style: const TextStyle(fontFamily: 'Source Sans 3'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentHistory(),
                    ),
                  );
                  // Navigate to payment history
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_calendar),
                title: Text(
                  '${loc.attendanceHistory}   >',
                  style: const TextStyle(fontFamily: 'Source Sans 3'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Attendence_History(),
                    ),
                  );
                  // Navigate to attendance history
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(
                  loc.selectLanguage,
                  style: const TextStyle(fontFamily: 'Source Sans 3'),
                ),
                trailing: DropdownButton<String>(
                  value: getLanguageFromCode(currentLocaleCode),
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem<String>(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      final languageCode = languageMap[value] ?? 'en';
                      ref
                          .read(localeProvider.notifier)
                          .setLocale(Locale(languageCode));
                    }
                  },
                ),
              ),
              const SizedBox(height: 350),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  '${loc.settings}   >',
                  style: const TextStyle(fontFamily: 'Source Sans 3'),
                ),
                onTap: () {
                  showLogoutPopup(context);
                },
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(
                  '${loc.logout}   >',
                  style: const TextStyle(fontFamily: 'Source Sans 3'),
                ),
                onTap: () {
                  showLogoutPopup(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LoginScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
            child: Column(
              children: List.generate(10, (index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Elevation1.png',
                            width: 100,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  loc.projectTitle,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFE85426),
                                    fontFamily: 'Source Sans 3',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  loc.projectAddress,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontFamily: 'Source Sans 3',
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed:
                                          _isPunchedIn
                                              ? null
                                              : () {
                                                setState(() {
                                                  _isPunchedIn = true;
                                                  _isPunchedOut = false;
                                                });
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => FaceVerificationScreen(
                                                //       punchInTime: DateTime.now(),
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            _isPunchedIn
                                                ? Colors.grey
                                                : const Color(0xFFE85426),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        loc.punchIn,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Source Sans 3',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed:
                                          _isPunchedIn && !_isPunchedOut
                                              ? () {
                                                setState(() {
                                                  _isPunchedOut = true;
                                                  _isPunchedIn = false;
                                                });
                                              }
                                              : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            _isPunchedOut
                                                ? Colors.grey
                                                : const Color(0xFFE85426),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        loc.punchOut,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Source Sans 3',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
