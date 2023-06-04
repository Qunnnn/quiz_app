import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/error.dart';
import 'package:quiz_app/core/error/exception.dart';
import 'package:quiz_app/features/quiz/data/datasources/remote_data_source.dart';
import '../../domain/domain.dart';


class RepoIml implements QuizRepo {
  RemoteDataSource remoteDataSource;
  RepoIml({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<QuizEntity>>> getRandomListQuiz() async {
    try {
      final listQuiz = await remoteDataSource.getListQuiz();
      return Right(listQuiz);
    } on SeverException {
      return Left(SeverFailure());
    }
  }
}
