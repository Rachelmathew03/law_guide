import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LawyerConnectivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lawyer Connectivity"),
        backgroundColor: Colors.brown.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find a Lawyer",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for lawyers by name, specialty, or location",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  lawyerCard(
                    context,
                    "John Varghese",
                    "Cyber Law Specialist",
                    "Delhi, India",
                    "john.varg@email.com",
                    "+1 123 456 7890",
                  ),
                  lawyerCard(
                    context,
                    "Ananthraj K P",
                    "Intellectual Property Lawyer",
                    "Patna, India",
                    "anantharaj@email.com",
                    "+1 987 654 3210",
                  ),
                  lawyerCard(
                    context,
                    "Geethanjali Varma",
                    "Privacy Law Expert",
                    "Mumbai, India",
                    "geethanjali@email.com",
                    "+1 555 666 7777",
                  ),
                  lawyerCard(
                    context,
                    "Zarah Ali",
                    "Cyber Law Specialist",
                    "Ahmedabad, India",
                    "zarahali@email.com",
                    "+1 678 027 5311",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lawyerCard(BuildContext context, String name, String specialty, String location, String email, String phone) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown.shade300,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            Text(location, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            showLawyerDetails(context, name, specialty, location, email, phone);
          },
          child: Text("Connect"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade700),
        ),
      ),
    );
  }

  void showLawyerDetails(BuildContext context, String name, String specialty, String location, String email, String phone) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,  // 80% of screen width
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(specialty, style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                SizedBox(height: 10),
                Text("📍 Location: $location", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.brown.shade700),
                    SizedBox(width: 8),
                    Expanded(child: Text(email, style: TextStyle(fontSize: 16))),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.brown.shade700),
                    SizedBox(width: 8),
                    Text(phone, style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close),
                      label: Text("Close"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade700),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        openGmail(email);
                      },
                      icon: Icon(Icons.message),
                      label: Text("Message"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openGmail(String email) async {
    final Uri gmailUri = Uri.parse(
        "https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=Legal Inquiry&body=Hello, I need your legal assistance.");

    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not open Gmail");
    }
  }
}

