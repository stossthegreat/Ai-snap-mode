import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumUpgradePage extends StatelessWidget {
  const PremiumUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Unlock Premium 💎', style: GoogleFonts.inter(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Go Premium for the Full Power:',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 16),
            _benefit('✨ Unlimited Glow-Ups'),
            _benefit('🧠 Pro-Level Rizz Enhancer'),
            _benefit('🚀 Instant DM Clapbacks'),
            _benefit('📂 Save Unlimited AI Results'),
            _benefit('🔓 Early Access to New Features'),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                // TODO: Integrate Stripe Checkout or In-App Purchase
              },
              child: Text(
                'Upgrade Now - \$4.99/mo',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Cancel anytime. No commitment.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _benefit(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.greenAccent, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
