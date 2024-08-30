import 'package:flutter/material.dart';
import 'package:quizapp/view/categoryscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.passindex});
  final int? passindex;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Categoryscreen(),
    );
  }
}
