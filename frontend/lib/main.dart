import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'chat.dart';
import 'lawyerconnectivity.dart';
import 'login.dart';
import 'signup.dart';
import 'settings.dart';
import 'news_screen.dart';
import 'awareness.dart';
import 'articles.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LawGuideApp());
}

class LawGuideApp extends StatelessWidget {
  const LawGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home", // Start from HomePage
      routes: {
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignUpPage(),
        "/home": (context) => LawGuideHomePage(),
        "/awareness": (context) => AwarenessPage(),
        "/news": (context) => NewsScreen(),
        "/articles": (context) => ArticlesPage(),
        "/lawyerconnectivity": (context) => LawyerConnectivityPage(),
        "/settings": (context) => SettingsPage(),
        "/chat": (context) => FirebaseAuth.instance.currentUser == null
            ? LoginPage() // If not logged in, redirect to login
            : ChatScreen(),
      },
    );
  }
}

class LawGuideHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Settings & Login/Logout Button
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/settings");
                          },
                          child: Text("Settings", style: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isLoggedIn ? Colors.red.shade200 : Colors.brown.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            if (isLoggedIn) {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(context, "/login");
                            } else {
                              Navigator.pushNamed(context, "/login");
                            }
                          },
                          child: Text(isLoggedIn ? "Logout" : "Login/Sign up",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // App Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Law Guide",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Providing the most efficient cyber law guide",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Chatbot Button (Restricted if not logged in)
                      GestureDetector(
                        onTap: () {
                          if (isLoggedIn) {
                            Navigator.pushNamed(context, "/chat");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please log in to access the Chatbot")),
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

                      // Feature Buttons
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton(context, "assets/lawyer.png", "Lawyer\nConnectivity", "/lawyerconnectivity"),
                              SizedBox(width: 8),
                              buildButton(context, "assets/news.png", "News", "/news"),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton(context, "assets/articles.png", "Articles", "/articles"),
                              SizedBox(width: 8),
                              buildButton(context, "assets/awareness.png", "Awareness", "/awareness"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, String imagePath, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 120,
        height: 120,
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
