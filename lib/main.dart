import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/features/main/data/datasources/remote_data_source.dart';
import 'package:quiz_app/features/main/data/repositories/repo_iml.dart';
import 'package:quiz_app/features/main/domain/usecases/get_random_quiz.dart';
import 'package:quiz_app/features/main/presentation/pages/start_page.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/features/main/presentation/provider/global_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalProvider(
          getRandomQuiz: GetRandomQuiz(
              quizRepo: RepoIml(remoteDataSource: RemoteDataSourceIml()))),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )
        ),
        home:  const StartPage(),
      ),
    );
  }
}
