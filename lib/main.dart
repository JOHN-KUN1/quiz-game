import 'package:flutter/material.dart';
import 'package:quiz_app/screens/get_started.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
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
      ),
    ),
  );
}
