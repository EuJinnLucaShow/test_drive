import 'package:flutter/material.dart';
import 'quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreensaverScreen(),
    );
  }
}

class ScreensaverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.9;
    double buttonHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 184, 88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20), // Add bottom padding
              child: SizedBox(
                height: 300, // Set height for the image
                child: Image.asset(
                  'images/logo.png', // Path to your image
                  fit: BoxFit.contain, // Adjust the image fit
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20), // Add bottom padding
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the new screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                      buttonWidth, buttonHeight), // Set the size of the button
                ),
                child: Text(
                  'I am new',
                  style: TextStyle(
                      fontSize: 28), // Set the font size of the button text
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Action for Button 2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                    buttonWidth, buttonHeight), // Set the size of the button
              ),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 28), // Set the font size of the button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
