import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onTap, {super.key});

  final void Function(String) onTap;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void answerQuestion(String ans) {
    setState(() {
      _currentQuestionIndex++;
    });
    widget.onTap(ans);
  }

  @override
  Widget build(BuildContext context) {
    final _currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 22, 51),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _currentQuestion.question,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              ..._currentQuestion.shuffleAnswers.map((itm) {
                return AnswerButton(
                  label: itm,
                  onTap: () {
                    answerQuestion(itm);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
