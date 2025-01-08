import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentPage = 'home';
  final _questions = questions;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget getCurrentPage() {
    switch (_currentPage) {
      case 'home':
        return HomeScreen(onChangeScreen);
      case 'quetions':
        return QuestionsScreen(onSelectAnswer);
      case 'result':
        return ResultScreen(choosenAnswers: selectedAnswers, onBack: onBackToStart);
      default:
        return HomeScreen(onChangeScreen); 
    }
  }

  void onChangeScreen() {
    setState(() {
      _currentPage = 'quetions';
    });
  }

  void onBackToStart() {
    setState(() {
      _currentPage = 'home';
      selectedAnswers = [];
    });
  }

  void onSelectAnswer(String ans) {
    selectedAnswers.add(ans);
    if (selectedAnswers.length == _questions.length) {
      setState(() {
        _currentPage = 'result';
      });
    }
  }

 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getCurrentPage(),
    );
  }
}
