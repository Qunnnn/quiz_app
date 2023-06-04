import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/error.dart';
import 'package:quiz_app/features/quiz/domain/entities/quiz_entity.dart';

abstract class QuizRepo {
  Future<Either<Failure, List<QuizEntity>>> getRandomListQuiz();
}
