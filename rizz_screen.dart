// rizz_screen.dart
import 'package:flutter/material.dart';

class RizzScreen extends StatefulWidget {
  const RizzScreen({super.key});

  @override
  State<RizzScreen> createState() => _RizzScreenState();
}

class _RizzScreenState extends State<RizzScreen> {
  double flirty = 0;
  double funny = 0;
  double confident = 0;
  String output = '';

  void generateRizz() {
    // Simulated rizz logic — replace with DeepSeek call
    setState(() {
      output = 'You must be a magician, because whenever I look at you, everyone else disappears 😏';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DM Rizz Wizard 😈'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose your tone:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              buildSlider('Flirty 😏', flirty, (val) => setState(() => flirty = val)),
              buildSlider('Funny 😹', funny, (val) => setState(() => funny = val)),
              buildSlider('Confident 😎', confident, (val) => setState(() => confident = val)),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                ),
                onPressed: generateRizz,
                child: const Text(
                  'Generate Rizz ✨',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              if (output.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(output,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlider(String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        Slider(
          value: value,
          onChanged: onChanged,
          min: 0,
          max: 100,
          activeColor: Colors.purpleAccent,
          inactiveColor: Colors.purple.shade100,
        ),
      ],
    );
  }
}
