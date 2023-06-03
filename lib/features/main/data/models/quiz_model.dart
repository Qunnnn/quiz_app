import 'package:quiz_app/features/main/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
 final String category;
 final String type;
 final String difficulty;
 final String question;
 final String correctAnswer;
 final List<String> incorrectAnswers;

 const QuizModel(
      {required this.category,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers})
      : super(
            category: category,
            type: type,
            difficulty: difficulty,
            question: question,
            correctAnswer: correctAnswer,
            incorrectAnswers: incorrectAnswers);

     factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );
}
