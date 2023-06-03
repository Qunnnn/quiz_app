import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/features/main/domain/entities/quiz_entity.dart';
import 'package:quiz_app/features/main/domain/usecases/get_random_quiz.dart';

class GlobalProvider extends ChangeNotifier {
  final GetRandomQuiz getRandomQuiz;
  int quizNumber = 0;
  GlobalProvider({required this.getRandomQuiz});
  List<QuizEntity> listQuiz = [];
  List<String> listAnswers = [];
  Future<void> getListQuizs() async {
    try {
      var quizs = await getRandomQuiz.excute();
      listQuiz = quizs.fold((l) => [], (r) => r);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  QuizEntity getQuiz() {
    return listQuiz[quizNumber];
  }

  List<String> getFullAnswers() {
    if (listAnswers.isEmpty) {
      listAnswers = getQuiz().incorrectAnswers;
      listAnswers.add(getQuiz().correctAnswer);
      shuffleList(listAnswers);
    }
    return listAnswers;
  }

  void nextQuiz() {
    if (quizNumber < listQuiz.length - 1) {
      listAnswers = [];
      quizNumber++;
      notifyListeners();
    }
  }

  bool isFinished() {
    if (quizNumber >= listQuiz.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void shuffleList(List list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }

  void reset() {
    listQuiz = [];
    quizNumber = 0;
    notifyListeners();
  }
}
