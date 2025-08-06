import 'package:flutter/material.dart';
import 'package:law_guide/home.dart'; // Import your home page
import 'package:law_guide/auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Auth _auth = Auth(); // Firebase Auth Instance

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
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email Field
                    Text("Email", style: TextStyle(color: Colors.white)),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Password Field
                    Text("Password", style: TextStyle(color: Colors.white)),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Login Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade200,
                        ),
                        onPressed: () async {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();

                          if (email.isNotEmpty && password.isNotEmpty) {
                            var user = await _auth.signIn(email, password);
                            if (user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Successful!")),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LawGuideHomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Invalid credentials!")),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("All fields are required!")),
                            );
                          }
                        },
                        child: Text("Login", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Sign Up Button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Text("Don't have an account? Sign up", style: TextStyle(color: Colors.white)),
                      ),
                    ),

                    // Back to Home Button
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade400,
                        ),
                        onPressed: () {
                          // Navigate directly to the home page after logout
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LawGuideHomePage()),
                          );
                        },
                        child: Text("Back to Home", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
