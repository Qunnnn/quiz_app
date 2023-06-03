import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  const QuizEntity({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [category, type, difficulty, question, correctAnswer, incorrectAnswers];
}
