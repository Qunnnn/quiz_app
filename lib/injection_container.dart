import 'package:get_it/get_it.dart';
import 'package:quiz_app/features/quiz/data/data.dart';
import 'package:quiz_app/features/quiz/domain/domain.dart';
import 'package:quiz_app/features/quiz/presentation/provider/global_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<GlobalProvider>(() => GlobalProvider(getRandomQuiz: sl()));

  sl.registerLazySingleton<GetRandomQuiz>(() => GetRandomQuiz(quizRepo: sl()));
  
  sl.registerLazySingleton<QuizRepo>(() => RepoIml(remoteDataSource: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceIml());
}
