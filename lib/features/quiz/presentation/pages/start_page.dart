import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/presentation/presentation.dart';
import '../../../../constant/constant.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(size.height * 0.3 , AppPaths.robotLogo),
              startButton(
                size,
                ontap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(),
                    )),
              ),
              SizedBox(
                height: size.height * 0.1,
              )
            ],
          ),
        )));
  }
}
