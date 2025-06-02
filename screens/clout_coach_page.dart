// lib/screens/clout_coach_page.dart
import 'package:flutter/material.dart';

class CloutCoachPage extends StatefulWidget {
  const CloutCoachPage({super.key});

  @override
  State<CloutCoachPage> createState() => _CloutCoachPageState();
}

class _CloutCoachPageState extends State<CloutCoachPage> {
  List<String> imagePaths = [];
  String platform = 'TikTok';
  double flirty = 20;
  double funny = 40;
  double confident = 40;
  String analysis = '';
  bool isLoading = false;

  final List<String> platforms = ['TikTok', 'Instagram', 'Snapchat'];

  void analyzeContent() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    setState(() {
      analysis = "\u2728 Analysis Result \u2728\n\n" // Fake example result
          "- Caption energy: Weak\n"
          "- Selfie angle: Overused\n"
          "- Suggestion: Use natural light, drop a POV caption, and open with a hook.";
      isLoading = false;
    });
  }

  Widget buildSlider(String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: onChanged,
          activeColor: Colors.pinkAccent,
          inactiveColor: Colors.white24,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Clout Coach 🔥'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8EC5FC), Color(0xFFE0C3FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Upload Post Screenshots:', style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text('Upload logic placeholder', style: TextStyle(color: Colors.white70)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: platform,
                    items: platforms.map((p) => DropdownMenuItem(
                      value: p,
                      child: Text(p),
                    )).toList(),
                    onChanged: (val) => setState(() => platform = val ?? 'TikTok'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSlider('Flirty 😏', flirty, (val) => setState(() => flirty = val)),
                  buildSlider('Funny 😹', funny, (val) => setState(() => funny = val)),
                  buildSlider('Confident 😎', confident, (val) => setState(() => confident = val)),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: isLoading ? null : analyzeContent,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Analyze My Clout', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (analysis.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(analysis, style: const TextStyle(fontSize: 16)),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
