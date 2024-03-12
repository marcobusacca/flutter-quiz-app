import 'package:flutter/material.dart';
import 'package:adv_basics/screen/start_screen.dart';
import 'package:adv_basics/screen/questions_screen.dart';
import 'package:adv_basics/screen/results_screen.dart';
import 'package:adv_basics/data/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String activeScreen = 'start_screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? activeScreenWidget;

    if (activeScreen == 'start_screen') {
      activeScreenWidget = StartScreen(switchScreen);
    }
    if (activeScreen == 'questions_screen') {
      activeScreenWidget = QuestionsScreen(chooseAnswer);
    }
    if (activeScreen == 'results_screen') {
      activeScreenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 59, 11, 95),
                Color.fromARGB(185, 70, 2, 122),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: activeScreenWidget,
          ),
        ),
      ),
    );
  }
}
