import 'package:flutter/material.dart';
import '../../../../constant/constant.dart';
import '../widgets/my_widgets.dart';



class ResultPage extends StatelessWidget {
  final int totalTime;
  final int scores;
  const ResultPage({required this.totalTime, required this.scores});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Dialog(
          backgroundColor: Colors.white,
          child: Container(
            height: size.height * 0.45,
            width: size.height * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white38,
                    offset: Offset(2, 4),
                  ),
                ]),
            child: Container(
              width: double.infinity,
              padding:const EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  scores >= 5
                      ? logo(size.height * 0.12, AppPaths.medalLogo)
                      : logo(size.height * 0.12, AppPaths.repeatLogo),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  scores >= 5
                      ? message(size,
                          scores: scores,
                          totalTime: totalTime,
                          title: 'Congratulations!!',
                          subTitle: 'You are amazing!!')
                      : message(size,
                          scores: scores,
                          totalTime: totalTime,
                          title: 'Completed!',
                          subTitle: 'Better luck next time!'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  replayBtn(context, size),
                ],
              ),
            ),
          )),
    );
  }
}
