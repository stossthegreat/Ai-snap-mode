import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectedAccountsPage extends StatefulWidget {
  const ConnectedAccountsPage({super.key});

  @override
  State<ConnectedAccountsPage> createState() => _ConnectedAccountsPageState();
}

class _ConnectedAccountsPageState extends State<ConnectedAccountsPage> {
  Map<String, bool> accountConnections = {
    'Snapchat': false,
    'Instagram': false,
    'TikTok': false,
  };

  void toggleConnection(String platform) {
    setState(() {
      accountConnections[platform] = !(accountConnections[platform] ?? false);
    });
  }

  Widget buildAccountTile(String platform, IconData icon) {
    final isConnected = accountConnections[platform] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: isConnected ? Colors.purpleAccent.withOpacity(0.4) : Colors.transparent,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          platform,
          style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
        ),
        trailing: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isConnected ? Colors.greenAccent.withOpacity(0.2) : Colors.white10,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isConnected ? Colors.greenAccent : Colors.white38,
              width: 1.2,
            ),
          ),
          child: Text(
            isConnected ? 'Connected' : 'Connect',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: isConnected ? Colors.greenAccent : Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        onTap: () => toggleConnection(platform),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Connected Accounts', style: GoogleFonts.inter(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            buildAccountTile('Snapchat', Icons.camera_alt_outlined),
            buildAccountTile('Instagram', Icons.camera),
            buildAccountTile('TikTok', Icons.music_note),
          ],
        ),
      ),
    );
  }
}
