import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/error.dart';
import '../domain.dart';


class GetRandomQuiz {
  QuizRepo quizRepo;
  GetRandomQuiz({required this.quizRepo});

  Future<Either<Failure, List<QuizEntity>>> excute() =>
      quizRepo.getRandomListQuiz();
}
