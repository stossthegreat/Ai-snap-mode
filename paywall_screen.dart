// paywall_screen.dart — FOMO Engine 💸🔥
import 'package:flutter/material.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Unlock GodMode 🔓'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFCF6BA), Color(0xFFF7D9E3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  'Your friends are already getting 10K+ likes with AI GodMode — you’re #194 on the waitlist.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, 8)),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text('Choose Your Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      _pricingTile(
                        label: 'Free Tier 😩',
                        price: '£0/mo',
                        features: [
                          '• 3 edits/day',
                          '• Watermarked images',
                          '• Basic captions only',
                          '• No rizz assistant 💔'
                        ],
                        highlight: false,
                      ),
                      const SizedBox(height: 16),
                      _pricingTile(
                        label: 'GodMode 🔥',
                        price: '£9.99/mo',
                        features: [
                          '• Unlimited edits',
                          '• No watermark',
                          '• Viral caption generator',
                          '• DM rizz assistant 💬'
                        ],
                        highlight: true,
                        isMostPopular: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => print('Subscribe logic goes here'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('Join 8,742 Users Before Price Hikes ⏰', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16),
                const Text(
                  '@xoxojenna gained 14K followers in 2 weeks using GodMode',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pricingTile({
    required String label,
    required String price,
    required List<String> features,
    bool highlight = false,
    bool isMostPopular = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFFEEE0FF) : const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: highlight ? Colors.deepPurple : Colors.grey.shade300, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              if (isMostPopular)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Most Popular',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
            ],
          ),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...features.map((f) => Text(f, style: const TextStyle(fontSize: 14))).toList(),
        ],
      ),
    );
  }
}
