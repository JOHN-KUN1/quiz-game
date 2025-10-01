import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/screens/get_started.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});

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
        child: const GetStartedScreen(),
      ),
    );
  }

}