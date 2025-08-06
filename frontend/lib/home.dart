/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_guide/articles.dart';
import 'package:law_guide/awareness.dart';
import 'package:law_guide/lawyerconnectivity.dart';
import 'package:law_guide/news_screen.dart';
import 'package:law_guide/bookmark_notes.dart';
import 'chat.dart';
import 'settings.dart';

class LawGuideHomePage extends StatefulWidget {
  @override
  _LawGuideHomePageState createState() => _LawGuideHomePageState();
}

class _LawGuideHomePageState extends State<LawGuideHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  void _logout() async {
    await _auth.signOut();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onSelected: (String choice) {
                      if (choice == 'Settings') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      } else if (choice == 'Logout') {
                        _logout();
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Settings',
                          child: Text('Settings'),
                        ),
                        if (_user != null)
                          PopupMenuItem(
                            value: 'Logout',
                            child: Text('Logout'),
                          ),
                      ];
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Law Guide",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Providing the cheapest and most efficient cyber law guide",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_user != null) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please log in to access the chatbot")),
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/chatbot.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, "assets/lawyer.png", "Lawyer Connectivity", LawyerConnectivityPage()),
                    SizedBox(width: 8),
                    buildButton(context, "assets/news.png", "News", NewsScreen()),
                    SizedBox(width: 8),
                    buildButton(context, "assets/articles.png", "Articles", ArticlesPage()),
                    SizedBox(width: 8),
                    buildButton(context, "assets/awareness.png", "Awareness", AwarenessPage()),
                    SizedBox(width: 8),
                    buildButton(context, "assets/bookmark.png", "Bookmarks & Notes", BookmarkNotesPage()),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, String imagePath, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_guide/articles.dart';
import 'package:law_guide/awareness.dart';
import 'package:law_guide/lawyerconnectivity.dart';
import 'package:law_guide/news_screen.dart';
import 'package:law_guide/bookmark_notes.dart';
import 'package:law_guide/chat.dart';
import 'package:law_guide/report.dart';
import 'package:law_guide/settings.dart';

class LawGuideHomePage extends StatefulWidget {
  @override
  _LawGuideHomePageState createState() => _LawGuideHomePageState();
}

class _LawGuideHomePageState extends State<LawGuideHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  void _logout() async {
    await _auth.signOut();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.darken),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onSelected: (String choice) {
                      if (choice == 'Settings') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      } else if (choice == 'Logout') {
                        _logout();
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Settings',
                          child: Text('Settings'),
                        ),
                        if (_user != null)
                          PopupMenuItem(
                            value: 'Logout',
                            child: Text('Logout'),
                          ),
                      ];
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Law Guide",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Providing the cheapest and most efficient cyber law guide",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_user != null) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please log in to access the chatbot")),
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/chatbot.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildButton(context, "assets/lawyer.png", "Lawyer Connectivity", LawyerConnectivityPage()),
                        SizedBox(width: 8),
                        buildButton(context, "assets/news.png", "News", NewsScreen()),
                        SizedBox(width: 8),
                        buildButton(context, "assets/articles.png", "Articles", ArticlesPage()),
                        SizedBox(width: 8),
                        buildButton(context, "assets/awareness.png", "Awareness", AwarenessPage()),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildButton(context, "assets/bookmark.png", "Notes", BookmarkNotesPage()),
                        SizedBox(width: 8),
                        buildButton(context, "assets/report1.jpg", "Report an Issue", ReportPage()),
                      ],
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, String imagePath, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

