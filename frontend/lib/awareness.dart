/*import 'package:flutter/material.dart';
import 'quiz.dart'; // Import the QuizPage

class AwarenessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cyber Law Awareness"),
        backgroundColor: const Color.fromARGB(255, 102, 69, 69),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // Ensure this exists
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Dark overlay
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Scrollable Content
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(" Protect Yourself in the Digital World! "),
                _buildSectionContent(
                  "Welcome to the Cyber Law Awareness page! \n\n"
                  "In today's fast-paced digital age, staying safe online is more important than ever. "
                  "Cybercriminals are constantly evolving, and so should you! \n\n"
                  "This page is your one-stop guide to understanding cyber laws, staying safe online, "
                  "and knowing what to do in case of a cyber emergency. Let's dive in and empower ourselves with knowledge! ",
                ),
                SizedBox(height: 20),

                _buildSectionTitle(" About IT Act 2000"),
                _buildSectionContent(
                  "The **Information Technology Act, 2000 (IT Act 2000)** is the backbone of cyber laws in India. "
                  "It provides legal recognition to electronic records and digital signatures, regulates cybercrime, "
                  "and ensures data protection. \n\n"
                  "Key provisions of the IT Act 2000 include:\n"
                  "• Penalties for hacking, data theft, and cyber terrorism.\n"
                  "• Safeguards for user privacy and data protection.\n"
                  "• Legal recognition of electronic transactions.\n\n"
                  "Understanding this act is crucial for staying compliant and protected in the digital world.",
                ),
                SizedBox(height: 20),

                _buildDropdownSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget: Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Adjusted for better contrast
      ),
    );
  }

  // Helper Widget: Section Content
  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white, // Adjusted for better readability
        height: 1.5,
      ),
    );
  }

  // Helper Widget: Dropdown Section
  Widget _buildDropdownSection(BuildContext context) {
    return Column(
      children: [
        _buildDropdown(
          title: "🧠 Test Your Knowledge",
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Take a quick quiz to test your understanding of cyber laws and online safety.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text("Start Quiz"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        _buildDropdown(
          title: "🔒 Safety Tips",
          children: [
            _buildBulletPoint("Use strong, unique passwords for all accounts."),
            _buildBulletPoint("Enable two-factor authentication (2FA) wherever possible."),
            _buildBulletPoint("Avoid clicking on suspicious links or downloading unknown attachments."),
            _buildBulletPoint("Regularly update your software and devices to patch vulnerabilities."),
            _buildBulletPoint("Be cautious when sharing personal information online."),
            _buildBulletPoint("Use a VPN to protect your online privacy."),
            _buildBulletPoint("Backup your data regularly to prevent loss in case of a cyberattack."),
          ],
        ),
        SizedBox(height: 10),

        _buildDropdown(
          title: "📚 References",
          children: [
            _buildBulletPoint("Cybercrime.gov.in - Official portal for reporting cybercrime in India."),
            _buildBulletPoint("GDPR.eu - Guide to the General Data Protection Regulation (GDPR)."),
            _buildBulletPoint("StaySafeOnline.org - Tips for staying safe online."),
            _buildBulletPoint("IT Act, 2000 - Indian legislation governing cyber laws."),
            _buildBulletPoint("NIC CERT - National Informatics Centre's Computer Emergency Response Team."),
          ],
        ),
        SizedBox(height: 10),

        _buildDropdown(
          title: "🚨 Emergency Contacts",
          children: [
            _buildBulletPoint("National Cyber Crime Helpline: 1930"),
            _buildBulletPoint("Cyber Crime Cell (Delhi): +91-11-20878110"),
            _buildBulletPoint("Cyber Crime Cell (Mumbai): +91-22-22641234"),
            _buildBulletPoint("Cyber Crime Cell (Bangalore): +91-80-22201020"),
            _buildBulletPoint("Cyber Crime Reporting Portal: https://cybercrime.gov.in"),
          ],
        ),
      ],
    );
  }

  // Helper Widget: Dropdown
  Widget _buildDropdown({required String title, required List<Widget> children}) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      children: children,
    );
  }

  // Helper Widget: Bullet Point
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16, color: Colors.white)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'quiz.dart'; // Import the QuizPage

class AwarenessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cyber Law Awareness"),
        backgroundColor: const Color.fromARGB(255, 102, 69, 69),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // Ensure this exists
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), // Dark overlay
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Scrollable Content
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader("Protect Yourself in the Digital World!"),
                _buildCard(
                  "Welcome to the Cyber Law Awareness page!",
                  "In today's fast-paced digital age, staying safe online is more important than ever. "
                  "Cybercriminals are constantly evolving, and so should you! \n\n"
                  "This page is your one-stop guide to understanding cyber laws, staying safe online, "
                  "and knowing what to do in case of a cyber emergency. Let's dive in and empower ourselves with knowledge! ",
                ),
                _buildHeader("About IT Act 2000"),
                _buildCard(
                  "The Information Technology Act, 2000",
                  "The IT Act 2000 provides legal recognition to electronic records and digital signatures, "
                  "regulates cybercrime, and ensures data protection. \n\n"
                  "Key provisions include: \n"
                  "• Penalties for hacking, data theft, and cyber terrorism.\n"
                  "• Safeguards for user privacy and data protection.\n"
                  "• Legal recognition of electronic transactions.",
                ),
                _buildDropdownSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget: Header Title
  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Helper Widget: Content Card
  Widget _buildCard(String title, String content) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Helper Widget: Dropdown Section
  Widget _buildDropdownSection(BuildContext context) {
    return Column(
      children: [
        _buildDropdown(
          title: "🧠 Test Your Knowledge",
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Take a quick quiz to test your understanding of cyber laws and online safety.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text("Start Quiz"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        _buildDropdown(
          title: "🔒 Safety Tips",
          children: [
            _buildBulletPoint("Use strong, unique passwords for all accounts."),
            _buildBulletPoint(
                "Enable two-factor authentication (2FA) wherever possible."),
            _buildBulletPoint(
                "Avoid clicking on suspicious links or downloading unknown attachments."),
            _buildBulletPoint(
                "Regularly update your software and devices to patch vulnerabilities."),
            _buildBulletPoint(
                "Be cautious when sharing personal information online."),
            _buildBulletPoint("Use a VPN to protect your online privacy."),
            _buildBulletPoint(
                "Backup your data regularly to prevent loss in case of a cyberattack."),
          ],
        ),
        SizedBox(height: 10),
        _buildDropdown(
          title: "📚 References",
          children: [
            _buildBulletPoint(
                "Cybercrime.gov.in - Official portal for reporting cybercrime in India."),
            _buildBulletPoint(
                "GDPR.eu - Guide to the General Data Protection Regulation (GDPR)."),
            _buildBulletPoint(
                "StaySafeOnline.org - Tips for staying safe online."),
            _buildBulletPoint(
                "IT Act, 2000 - Indian legislation governing cyber laws."),
            _buildBulletPoint(
                "NIC CERT - National Informatics Centre's Computer Emergency Response Team."),
          ],
        ),
        SizedBox(height: 10),
        _buildDropdown(
          title: "🚨 Emergency Contacts",
          children: [
            _buildBulletPoint("National Cyber Crime Helpline: 1930"),
            _buildBulletPoint("Cyber Crime Cell (Delhi): +91-11-20878110"),
            _buildBulletPoint("Cyber Crime Cell (Mumbai): +91-22-22641234"),
            _buildBulletPoint("Cyber Crime Cell (Bangalore): +91-80-22201020"),
            _buildBulletPoint(
                "Cyber Crime Reporting Portal: https://cybercrime.gov.in"),
          ],
        ),
      ],
    );
  }

  // Helper Widget: Dropdown
  Widget _buildDropdown(
      {required String title, required List<Widget> children}) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      children: children,
    );
  }

  // Helper Widget: Bullet Point
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16, color: Colors.white)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
