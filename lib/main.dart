import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'features/quiz/quiz.dart';

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
