import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/get_started.dart';
import 'package:quiz_app/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.numOfCorrect,
    required this.userAnswers,
    required this.correctAnswers,
    required this.questionsList,
  });

  final int numOfCorrect;
  final List<String> userAnswers;
  final List<String> correctAnswers;
  final List<String> questionsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'You have answered $numOfCorrect out of 6 correctly',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 6; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Summary(
                            questionNumber: (i + 1).toString(),
                            question: questionsList[i],
                            userAnswer: userAnswers[i],
                            correctAnswer: correctAnswers[i],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetStartedScreen(),
                  ),
                );
              },
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                minimumSize: const Size(150, 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
