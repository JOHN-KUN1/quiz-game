import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/screens/result.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionScreen> {
  Future? loadQuestions;
  FirebaseDatabase database = FirebaseDatabase.instance;
  final List<String> chosenAnswers = [];
  final List<String> actualAnswers = [];
  final List<String> questions = [];
  int correctAnswers = 0;
  int questionNumber = 1;
  String question = '';
  String answer = '';
  String optionA = '';
  String optionB = '';
  String optionC = '';
  String optionD = '';

  Future<void> getQuestions() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(questionNumber.toString()).get();
    if (snapshot.exists) {
      setState(() {
        question = snapshot.child('question').value.toString();
        answer = snapshot.child('answer').value.toString();
        optionA = snapshot.child('a').value.toString();
        optionB = snapshot.child('b').value.toString();
        optionC = snapshot.child('c').value.toString();
        optionD = snapshot.child('d').value.toString();
      });
    } else {
      print('-----Not found');
    }
  }

  Future<void> nextQuestion() async {
    if (questionNumber > 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            numOfCorrect: correctAnswers,
            userAnswers: chosenAnswers,
            correctAnswers: actualAnswers,
            questionsList: questions,
          ),
        ),
      );
    } else {
      await getQuestions();
    }
  }

  @override
  void initState() {
    super.initState();
    loadQuestions = getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlue, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () async {
                  if (optionA == answer) {
                    correctAnswers++;
                  }
                  questions.add(question);
                  chosenAnswers.add(optionA);
                  actualAnswers.add(answer);
                  questionNumber++;
                  await nextQuestion();
                },
                child: Text(
                  textAlign: TextAlign.center,
                  optionA,
                  style: GoogleFonts.lato(color: Colors.blueAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () async {
                  if (optionB == answer) {
                    correctAnswers++;
                  }
                  questions.add(question);
                  chosenAnswers.add(optionB);
                  actualAnswers.add(answer);
                  questionNumber++;
                  await nextQuestion();
                },
                child: Text(
                  optionB,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(color: Colors.blueAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () async {
                  if (optionC == answer) {
                    correctAnswers++;
                  }
                  questions.add(question);
                  chosenAnswers.add(optionC);
                  actualAnswers.add(answer);
                  questionNumber++;
                  await nextQuestion();
                },
                child: Text(
                  textAlign: TextAlign.center,
                  optionC,
                  style: GoogleFonts.lato(color: Colors.blueAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () async {
                  if (optionD == answer) {
                    correctAnswers++;
                  }
                  questions.add(question);
                  chosenAnswers.add(optionD);
                  actualAnswers.add(answer);
                  questionNumber++;
                  await nextQuestion();
                },
                child: Text(
                  textAlign: TextAlign.center,
                  optionD,
                  style: GoogleFonts.lato(color: Colors.blueAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: FutureBuilder(
        future: loadQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.blueAccent,
                  size: 100,
                ),
              ),
            );
          }
          return content;
        },
      ),
    );
  }
}
