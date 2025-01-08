class QuestionModel{
  const QuestionModel(this.question, this.answers,this.correctAanswers);

  final String question;
  final List<String> answers;
  final String correctAanswers;


  List<String> get shuffleAnswers{
    final suffAnd = List.of(answers);
    suffAnd.shuffle();
    return suffAnd;
  }
}