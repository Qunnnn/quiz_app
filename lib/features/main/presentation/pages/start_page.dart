import 'package:flutter/material.dart';
import 'package:quiz_app/constant/constant.dart';
import 'package:quiz_app/features/main/presentation/pages/quiz_page.dart';
import '../widgets/my_widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(size.height * 0.3 , robotLogo),
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
