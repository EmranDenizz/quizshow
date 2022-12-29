import 'package:flutter/material.dart';

void main() {
  runApp(QuizShow());
}

class QuizShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffE0F7FA),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
