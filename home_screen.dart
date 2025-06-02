// home_screen.dart — Charisma GodMode Hub 💫
import 'package:flutter/material.dart';
import 'upload_screen.dart';
import 'rizz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FF),
      appBar: AppBar(
        title: const Text('AI Snapchat GodMode'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Choose your vibe 🔥',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(height: 30),
            HomeTile(
              title: 'Upload & Enhance',
              emoji: '📤',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UploadScreen()),
              ),
            ),
            const SizedBox(height: 20),
            HomeTile(
              title: 'Rizz Generator',
              emoji: '💬',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RizzScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  final String title;
  final String emoji;
  final VoidCallback onTap;

  const HomeTile({
    super.key,
    required this.title,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
      ),
    );
  }
}
