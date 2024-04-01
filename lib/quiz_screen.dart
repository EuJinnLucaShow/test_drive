import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Rome'],
      'answerIndex': 0,
    },
    {
      "question": "What is the largest planet in our Solar System?",
      "options": ["Jupiter", "Saturn", "Neptune", "Mars"],
      "answerIndex": 0
    },
    {
      "question": "Who wrote 'Romeo and Juliet'?",
      "options": [
        "William Shakespeare",
        "Charles Dickens",
        "Jane Austen",
        "Mark Twain"
      ],
      "answerIndex": 0
    },
    {
      "question": "What is the main ingredient in guacamole?",
      "options": ["Tomato", "Avocado", "Onion", "Pepper"],
      "answerIndex": 1
    },
    {
      "question": "Which country is known as the Land of the Rising Sun?",
      "options": ["China", "Australia", "Japan", "Thailand"],
      "answerIndex": 2
    },
    {
      "question": "What is the hardest natural substance on Earth?",
      "options": ["Diamond", "Gold", "Iron", "Quartz"],
      "answerIndex": 0
    }
  ];
  List<int?> _userResponses = List.filled(7, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuestion(_questions[_currentQuestionIndex])
          : _buildResult(),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> questionData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionData['question'],
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Column(
          children: List.generate(
            questionData['options'].length,
            (index) => RadioListTile(
              title: Text(questionData['options'][index]),
              value: index,
              groupValue: _userResponses[_currentQuestionIndex],
              onChanged: (value) {
                setState(() {
                  _userResponses[_currentQuestionIndex] = value;
                });
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_currentQuestionIndex < _questions.length - 1) {
                _currentQuestionIndex++;
              } else {
                // Navigate to result screen or calculate score
                _navigateToResultScreen();
              }
            });
          },
          child: Text(
            'Next',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    // Calculate score and display result
    // You can implement this part based on your requirements
    return Center(
      child: Text(
        'Quiz Completed!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void _navigateToResultScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          userResponses: _userResponses,
          questions: _questions,
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final List<int?> userResponses;
  final List<Map<String, dynamic>> questions;

  const ResultScreen({
    required this.userResponses,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate score and display result
    int score = _calculateScore();
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Text(
          'Your score: $score',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userResponses[i] == questions[i]['answerIndex']) {
        score++;
      }
    }
    return score;
  }
}
