import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylePreferencePage extends StatefulWidget {
  const StylePreferencePage({super.key});

  @override
  State<StylePreferencePage> createState() => _StylePreferencePageState();
}

class _StylePreferencePageState extends State<StylePreferencePage> {
  String selectedStyle = 'Gen-Z';

  Widget styleCard(String label, String emoji, Color color) {
    bool isSelected = selectedStyle == label;
    return GestureDetector(
      onTap: () => setState(() => selectedStyle = label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : Colors.white24,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Style Preference', style: GoogleFonts.inter(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose your content tone:',
              style: GoogleFonts.inter(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: styleCard('Gen-Z', '😎', Colors.purpleAccent)),
                const SizedBox(width: 16),
                Expanded(child: styleCard('Classic 25+', '🧠', Colors.blueAccent)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
