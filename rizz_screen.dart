// rizz_screen.dart — Fully Upgraded, Ultra Polished ✨
import 'package:flutter/material.dart';
import '../services/ai_caption_service.dart';

class RizzScreen extends StatefulWidget {
  const RizzScreen({super.key});

  @override
  State<RizzScreen> createState() => _RizzScreenState();
}

class _RizzScreenState extends State<RizzScreen> {
  double flirty = 0;
  double funny = 0;
  double confident = 0;
  String outputCaption = '';
  String outputRizz = '';
  String? selectedVibe;
  String? selectedGender;
  String? selectedPlatform;
  bool isLoading = false;

  final List<String> vibes = [
    'chaotic', 'chill', 'e-girl/boy', 'luxe', 'neutral'
  ];

  final List<String> genders = [
    'neutral', 'femme', 'masc'
  ];

  final List<String> platforms = [
    'TikTok', 'Instagram', 'Snapchat'
  ];

  Future<void> generateRizz() async {
    setState(() => isLoading = true);

    try {
      final result = await AICaptionService().generateUltraRizz(
        flirty: flirty.toInt(),
        funny: funny.toInt(),
        confident: confident.toInt(),
        vibe: selectedVibe,
        gender: selectedGender,
        platform: selectedPlatform,
      );
      setState(() {
        outputCaption = result['caption'] ?? '';
        outputRizz = result['rizz'] ?? '';
      });
    } catch (e) {
      print('Error: $e');
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('DM Rizz Wizard 😈'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0C3FC), Color(0xFF8EC5FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Choose Your Tone:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 16),
                        buildSlider('Flirty 😏', flirty, (val) => setState(() => flirty = val)),
                        buildSlider('Funny 😹', funny, (val) => setState(() => funny = val)),
                        buildSlider('Confident 😎', confident, (val) => setState(() => confident = val)),
                        const SizedBox(height: 16),
                        buildDropdown('Vibe', selectedVibe, vibes, (val) => setState(() => selectedVibe = val)),
                        const SizedBox(height: 16),
                        buildDropdown('Gender Tone', selectedGender, genders, (val) => setState(() => selectedGender = val)),
                        const SizedBox(height: 16),
                        buildDropdown('Platform Target', selectedPlatform, platforms, (val) => setState(() => selectedPlatform = val)),
                        const SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                              elevation: 6,
                            ),
                            onPressed: isLoading ? null : generateRizz,
                            child: isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text('✨ Generate Rizz', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (outputCaption.isNotEmpty || outputRizz.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (outputCaption.isNotEmpty) ...[
                            const Text('Your Caption:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            Text(outputCaption, style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 16),
                          ],
                          if (outputRizz.isNotEmpty) ...[
                            const Text('Your Rizz:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            Text(outputRizz, style: const TextStyle(fontSize: 16)),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSlider(String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        Slider(
          value: value,
          onChanged: onChanged,
          min: 0,
          max: 100,
          activeColor: Colors.purpleAccent,
          inactiveColor: Colors.white24,
        ),
      ],
    );
  }

  Widget buildDropdown(String title, String? selectedValue, List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: const TextStyle(color: Colors.black)),
                  ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
