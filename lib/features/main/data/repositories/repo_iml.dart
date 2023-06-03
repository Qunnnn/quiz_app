import 'package:dartz/dartz.dart';
import 'package:quiz_app/error/error.dart';
import 'package:quiz_app/error/exception.dart';
import 'package:quiz_app/features/main/data/datasources/remote_data_source.dart';
import 'package:quiz_app/features/main/domain/entities/quiz_entity.dart';
import 'package:quiz_app/features/main/domain/repositories/quiz_repo.dart';

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
