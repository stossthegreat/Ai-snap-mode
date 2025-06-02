import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Pages
import 'pages/upload_page.dart';
import 'pages/rizz_page.dart';
import 'pages/clapback_page.dart';
import 'pages/clout_engine_page.dart';
import 'pages/saved_vault_page.dart';
import 'pages/settings_page.dart';

class MainTabbedApp extends StatefulWidget {
  const MainTabbedApp({super.key});

  @override
  State<MainTabbedApp> createState() => _MainTabbedAppState();
}

class _MainTabbedAppState extends State<MainTabbedApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    UploadPage(),        // 📸 Godmode
    RizzPage(),          // 😏 Rizzify
    ClapbackPage(),      // 🔫 Clapback
    CloutEnginePage(),   // 💯 Clout Coach
    SavedVaultPage(),    // 📂 Vault
    SettingsPage(),      // ⚙️ Settings
  ];

  final List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'Godmode'),
    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Rizzify'),
    BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Clapback'),
    BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Clout'),
    BottomNavigationBarItem(icon: Icon(Icons.folder_special), label: 'Vault'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _tabs,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.inter(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
