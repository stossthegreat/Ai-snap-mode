// main.dart
import 'package:flutter/material.dart';
import 'screens/upload_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const GodModeApp());
}

class GodModeApp extends StatelessWidget {
  const GodModeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Snapchat GodMode',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const UploadScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}

