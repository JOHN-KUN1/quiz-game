import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });

  final String questionNumber;
  final String question;
  final String userAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: userAnswer == correctAnswer ? Colors.greenAccent :const Color.fromARGB(255, 246, 143, 178),
            ),
            child: Center(
              child: Text(
                questionNumber,
                style: const TextStyle(
                  color:  Color.fromARGB(
                    255,
                    33,
                    61,
                    243,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question, textAlign: TextAlign.left,softWrap: true,style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              Text(userAnswer, style: GoogleFonts.lato(
                color: Colors.white.withValues(alpha: 0.6)
              ),),
              Text(correctAnswer, style: GoogleFonts.lato(
                color: Colors.greenAccent
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
