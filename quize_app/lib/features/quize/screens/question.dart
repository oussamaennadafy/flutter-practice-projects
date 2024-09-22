import 'package:flutter/material.dart';
import 'package:quize_app/features/quize/components/question/question.dart';
import 'package:quize_app/features/quize/data/questions.dart';
import 'package:quize_app/features/quize/screens/resume.dart';

class QuizeQuestion extends StatefulWidget {
  const QuizeQuestion({super.key});

  @override
  State<QuizeQuestion> createState() => _QuestionState();
}

class _QuestionState extends State<QuizeQuestion> {
  int questionNumber = 1;
  int numberOfAnsweredQuestions = 0;
  final List<Map<String, dynamic>> results = [];

  void submitAnswer(int id) {
    final rightAnswer = quizQuestions[questionNumber - 1]["answer"];
    final usersAnswer = quizQuestions[questionNumber - 1]["choices"][id];
    results.add({
      "question": quizQuestions[questionNumber - 1]["question"],
      "right_answer": rightAnswer,
      "users_answer": usersAnswer,
      "is_right": rightAnswer == usersAnswer,
    });
    if (usersAnswer == rightAnswer) numberOfAnsweredQuestions++;
  }

  void handleAnwserPress(int id) {
    if (questionNumber == quizQuestions.length) {
      submitAnswer(id);
      // navigate to resume
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => QuizeResume(
            numberOfAnsweredQuestions: numberOfAnsweredQuestions,
            results: results,
          ),
        ),
      );
    } else {
      submitAnswer(id);
      // next question
      setState(() {
        questionNumber++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Question(
      question: quizQuestions[questionNumber - 1]["question"],
      choices: quizQuestions[questionNumber - 1]["choices"],
      onAnswerPress: handleAnwserPress,
    );
  }
}
