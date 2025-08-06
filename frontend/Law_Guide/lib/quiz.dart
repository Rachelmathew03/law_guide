import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Quiz Variables
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the primary legislation governing cyber laws in India?",
      "options": ["IT Act 2000", "IPC", "Companies Act", "Consumer Protection Act"],
      "answer": "IT Act 2000",
    },
    {
      "question": "Which section of the IT Act deals with cyber terrorism?",
      "options": ["Section 66", "Section 43", "Section 70", "Section 66F"],
      "answer": "Section 66F",
    },
    {
      "question": "What is the penalty for hacking under the IT Act?",
      "options": ["Fine only", "Imprisonment only", "Both fine and imprisonment", "No penalty"],
      "answer": "Both fine and imprisonment",
    },
    {
      "question": "Which body regulates cyber laws in India?",
      "options": ["RBI", "SEBI", "Ministry of Electronics and IT", "Ministry of Home Affairs"],
      "answer": "Ministry of Electronics and IT",
    },
    {
      "question": "What is the punishment for identity theft under the IT Act?",
      "options": ["1 year imprisonment", "3 years imprisonment", "5 years imprisonment", "No punishment"],
      "answer": "3 years imprisonment",
    },
    {
      "question": "Which of the following is a cybercrime?",
      "options": ["Phishing", "Online shopping", "Social media browsing", "Emailing"],
      "answer": "Phishing",
    },
    {
      "question": "What is the full form of CERT-In?",
      "options": [
        "Computer Emergency Response Team - India",
        "Cyber Emergency Response Team - India",
        "Cyber Enforcement and Regulation Team - India",
        "Computer Enforcement and Regulation Team - India"
      ],
      "answer": "Computer Emergency Response Team - India",
    },
    {
      "question": "Which section of the IT Act deals with data protection?",
      "options": ["Section 43A", "Section 66", "Section 70", "Section 72"],
      "answer": "Section 43A",
    },
    {
      "question": "What is the punishment for publishing obscene content online?",
      "options": ["1 year imprisonment", "3 years imprisonment", "5 years imprisonment", "No punishment"],
      "answer": "3 years imprisonment",
    },
    {
      "question": "Which of the following is NOT a cybercrime?",
      "options": ["Hacking", "Phishing", "Online banking", "Identity theft"],
      "answer": "Online banking",
    },
  ];

  List<String?> userAnswers = List.filled(10, null);
  int score = 0;
  bool showAnswers = false;

  // Function to calculate score
  void calculateScore() {
    score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i]["answer"]) {
        score++;
      }
    }
    setState(() {});
  }

  // Function to reset quiz
  void resetQuiz() {
    userAnswers = List.filled(10, null);
    score = 0;
    showAnswers = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cyber Law Quiz"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quiz Questions
            ...questions.map((question) {
              int index = questions.indexOf(question);
              return _buildQuizQuestion(
                question: question["question"],
                options: question["options"],
                selectedAnswer: userAnswers[index],
                onChanged: (value) {
                  setState(() {
                    userAnswers[index] = value;
                  });
                },
                showAnswers: showAnswers,
                correctAnswer: question["answer"],
              );
            }).toList(),
            SizedBox(height: 20),

            // Score and Buttons
            Text(
              "Your Score: $score/${questions.length}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: calculateScore,
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showAnswers = !showAnswers;
                    });
                  },
                  child: Text(showAnswers ? "Hide Answers" : "View Answers"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: resetQuiz,
                  child: Text("Reset Quiz"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget: Quiz Question
  Widget _buildQuizQuestion({
    required String question,
    required List<String> options,
    required String? selectedAnswer,
    required Function(String?) onChanged,
    required bool showAnswers,
    required String correctAnswer,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 10),
            ...options.map((option) {
              bool isCorrect = option == correctAnswer;
              bool isSelected = option == selectedAnswer;
              return RadioListTile<String>(
                title: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    color: showAnswers
                        ? (isCorrect
                            ? Colors.green
                            : (isSelected ? Colors.red : Colors.black87))
                        : Colors.black87,
                  ),
                ),
                value: option,
                groupValue: selectedAnswer,
                onChanged: onChanged,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}