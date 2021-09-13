import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_riverpod/enums/difficulty.dart';
import 'package:quiz_riverpod/repository/quiz.dart';

import 'package:quiz_riverpod/screens/quiz_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS Quiz',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent)),
      home: QuizScreen(),
    );
  }
}
