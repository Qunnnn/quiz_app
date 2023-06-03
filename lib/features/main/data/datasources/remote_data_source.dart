import 'package:http/http.dart' as http;
import 'package:quiz_app/error/exception.dart';
import 'package:quiz_app/features/main/data/models/quiz_model.dart';
import 'dart:convert';

abstract class RemoteDataSource {
  Future<List<QuizModel>> getListQuiz();
}

class RemoteDataSourceIml implements RemoteDataSource {
  final String baseURL = 'https://opentdb.com/api.php?amount=10';
  @override
  Future<List<QuizModel>> getListQuiz() async {
    List<QuizModel> quizList = [];
    var url = Uri.parse("$baseURL");
    final repsponse = await http.get(url);
    if (repsponse.statusCode == 200) {
      var quizs = jsonDecode(repsponse.body)['results'];
      for (var quiz in quizs) {
        quizList.add(QuizModel.fromJson(quiz));
      }
    } else {
      throw SeverException();
    }
    return quizList;
  }
}
