import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onBack});

  final List<String> choosenAnswers;
  final void Function() onBack;
  
    final _questions = questions;

  List<Map<String, Object>> get getSummaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': _questions[i].question,
        'choosen_answer': choosenAnswers[i],
        'correct_answer': _questions[i].correctAanswers,
        'correct': choosenAnswers[i] == _questions[i].correctAanswers
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final _questionsCount = _questions.length;
    final _correctAnswerCount = getSummaryData.where((element) => (element['correct'] as bool)==true).length;




    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Your answered $_correctAnswerCount out of $_questionsCount questions correctly!."),
                SizedBox(height: 15,),
                SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                     ...getSummaryData.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 30,
                                height: 30,
                                // padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: !(item['correct'] as bool)
                                        ? Colors.redAccent
                                        : Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    ((item['question_index'] as int) + 1).toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                                SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,                        
                                children: [
                                  Text(item['question'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                  ),),
                                  Text(item['choosen_answer'].toString(),
                                  style: TextStyle(
                                    color: !(item['correct'] as bool)
                                        ? Colors.redAccent
                                        : Colors.greenAccent,
                                  ),),
                                  // Text(item['correct_answer'].toString())
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    
                      ],
                    ),
                  ),
                ),
               SizedBox(height: 15,),
               AnswerButton(label: 'Back', onTap: onBack),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
