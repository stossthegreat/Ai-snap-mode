import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.purpleAccent,
        ),
      ),
    );
  }

  Widget _switchTile(String label, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(label, style: GoogleFonts.inter(color: Colors.white)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.purpleAccent,
    );
  }

  Widget _settingsTile(String label, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(label, style: GoogleFonts.inter(color: Colors.white)),
      leading: Icon(icon, color: Colors.white70),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool genZMode = true;
    bool voiceRizz = false;
    bool notifAccess = true;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Settings', style: GoogleFonts.inter(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _sectionTitle('Preferences'),
          _switchTile('Gen-Z Mode', genZMode, (val) {}),
          _switchTile('Enable Voice Rizz', voiceRizz, (val) {}),
          _switchTile('Notification Access', notifAccess, (val) {}),

          _sectionTitle('Personalization'),
          _settingsTile('Style Preference', Icons.palette, () {}),
          _settingsTile('Connected Accounts', Icons.link, () {}),

          _sectionTitle('Premium'),
          _settingsTile('Upgrade to Premium 💎', Icons.star, () {}),

          _sectionTitle('Support'),
          _settingsTile('Report a Bug', Icons.bug_report, () {}),
          _settingsTile('Contact Support', Icons.headset_mic, () {}),
          _settingsTile('Terms & Conditions', Icons.policy, () {}),
          _settingsTile('Privacy Policy', Icons.privacy_tip, () {}),
        ],
      ),
    );
  }
}
