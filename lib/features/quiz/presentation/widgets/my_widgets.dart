import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/features/quiz/presentation/presentation.dart';
import '../../../../constant/constant.dart';

InkWell startButton(Size size, {required void Function()? ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: size.height * 0.05,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15)),
      child: const Center(
          child: Text('Start Quiz!',
              style: AppTextStyle.buttonTextStyle)),
    ),
  );
}

SvgPicture logo(double size, String path) {
  return SvgPicture.asset(
    path,
    height: size,
  );
}

RichText questionBannerWidget(GlobalProvider quiz) {
  return RichText(
      text: TextSpan(
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          text: 'Question ${quiz.quizNumber + 1}',
          children: [
        TextSpan(
            text: '/${quiz.listQuiz.length}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            )),
      ]));
}

Column message(Size size,
    {required scores,
    required totalTime,
    required String title,
    required String subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      SizedBox(
        height: size.height * 0.01,
      ),
      Text(
        subTitle,
        style:const TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: size.height * 0.01,
      ),
      Text(
        '$scores/10 corrects answer in $totalTime seconds',
        style: const TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ],
  );
}

InkWell replayBtn(BuildContext context, Size size) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizPage(),
          ));
    },
    child: Container(
      height: size.height * 0.05,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: const Center(
        child: Text(
          'Play Again',
          style: AppTextStyle.buttonTextStyle,
        ),
      ),
    ),
  );
}

Column quizField(double defaultPadding, GlobalProvider quiz) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'Category:',
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(
            width: defaultPadding * 0.2,
          ),
          Expanded(
            child: Text(
              quiz.getQuiz().category,
              overflow: TextOverflow.clip,
              style: AppTextStyle.contentTextStyle,
            ),
          ),
        ],
      ),
      SizedBox(
        height: defaultPadding * 0.2,
      ),
      Row(
        children: [
          Text(
            'Difficulty:',
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(
            width: defaultPadding * 0.2,
          ),
          Text(
            quiz.getQuiz().difficulty,
            style: AppTextStyle.contentTextStyle,
          ),
        ],
      ),
      SizedBox(
        height: defaultPadding * 0.5,
      ),
      Text(
        quiz.getQuiz().question,
        textAlign: TextAlign.center,
        style: AppTextStyle.questionTextStyle,
      ),
    ],
  );
}
