import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String enhancedImagePath;
  final String caption;
  final String rizz;

  const ResultsScreen({
    super.key,
    required this.enhancedImagePath,
    required this.caption,
    required this.rizz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Your AI Glow-Up ✨'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB6FBFF), Color(0xFF83A4D4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    enhancedImagePath,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 24),
                buildTextBlock('📸 Viral Caption', caption),
                const SizedBox(height: 16),
                buildTextBlock('💬 DM Rizz', rizz),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.download_rounded),
                      label: const Text('Save'),
                      onPressed: () {
                        // TODO: Save to device logic
                      },
                      style: elevatedBtn(),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.send_rounded),
                      label: const Text('Share'),
                      onPressed: () {
                        // TODO: Share to socials
                      },
                      style: elevatedBtn(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextBlock(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ),
      ],
    );
  }

  ButtonStyle elevatedBtn() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 5,
    );
  }
}
