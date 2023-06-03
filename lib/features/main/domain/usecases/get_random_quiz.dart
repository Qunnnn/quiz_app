import 'package:dartz/dartz.dart';
import 'package:quiz_app/error/error.dart';
import 'package:quiz_app/features/main/domain/entities/quiz_entity.dart';
import 'package:quiz_app/features/main/domain/repositories/quiz_repo.dart';

class GetRandomQuiz {
  QuizRepo quizRepo;
  GetRandomQuiz({required this.quizRepo});

  Future<Either<Failure, List<QuizEntity>>> excute() =>
      quizRepo.getRandomListQuiz();
}
