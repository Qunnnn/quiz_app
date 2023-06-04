import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/features/quiz/presentation/presentation.dart';
import '../../../../constant/constant.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late GlobalProvider globalProvider;
  int currentIndex = 0;
  int selected = -1;
  Color btnColor = Colors.white;
  bool isPressed = false;
  bool correctAns = false;
  IconData iconbutn = Icons.circle_outlined;
  int scores = 0;
  late DateTime startTime;
  @override
  void initState() {
    startTime = DateTime.now();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      globalProvider = Provider.of<GlobalProvider>(context, listen: false);
      globalProvider.getListQuizs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final defaultPadding = size.height * 0.06;

    final quiz = context.watch<GlobalProvider>();
    if (quiz.listQuiz.isEmpty) {
      return const Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: SpinKitChasingDots(color: Colors.white),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: defaultPadding * 0.4,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    quiz.reset();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>const StartPage()));
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: defaultPadding * 0.3,
              ),
              questionBannerWidget(quiz),
              SizedBox(
                height: defaultPadding * 0.2,
              ),
              quizField(defaultPadding, quiz),
              SizedBox(
                height: defaultPadding,
              ),
              answerField(quiz, size),
              SizedBox(
                height: defaultPadding * 0.7,
              ),
              nextBtn(quiz, size),
            ],
          ),
        ),
      ),
    );
  }

  InkWell nextBtn(GlobalProvider quiz, Size size) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        checkQuiz(quiz);
      },
      child: Container(
        height: size.height * 0.065,
        width: size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: isPressed ? Colors.red : Colors.grey,
          ),
          color: isPressed ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            quiz.quizNumber == 9 ? 'Result' : 'Next',
            style: AppTextStyle.buttonTextStyle,
          ),
        ),
      ),
    );
  }

  Column answerField(GlobalProvider quiz, Size size) {
    return Column(
      children: [
        ...List.generate(
            quiz.getFullAnswers().length,
            (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressed = true;
                      selected = index;
                      correctAns = checkAns(quiz, index);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selected == index && correctAns
                              ? btnColor
                              : Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            quiz.getFullAnswers()[index],
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: selected == index && correctAns
                                    ? btnColor
                                    : Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            selected == index && correctAns
                                ? iconbutn
                                : Icons.circle_outlined,
                            color: selected == index && correctAns
                                ? btnColor
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
      ],
    );
  }

  bool checkAns(GlobalProvider quiz, int index) {
    if (quiz.getQuiz().correctAnswer == quiz.getFullAnswers()[index]) {
      setState(() {
        btnColor = AppColors.isAnsTrue;
        iconbutn = Icons.check_circle_outline;
        scores++;
      });
      return true;
    }
    if (quiz.getQuiz().correctAnswer != quiz.getFullAnswers()[index]) {
      setState(() {
        btnColor = AppColors.isAnsWrong;
        iconbutn = Icons.check_circle_outline;
      });
      return true;
    }
    return false;
  }

  void checkQuiz(GlobalProvider quiz) {
    if (quiz.isFinished()) {
      final DateTime endTime = DateTime.now();
      final totalTime = endTime.difference(startTime);
      quiz.reset();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              totalTime: totalTime.inSeconds,
              scores: scores,
            ),
          ));
    } else if (isPressed) {
      setState(() {
        btnColor = Colors.white;
        selected = -1;
        isPressed = false;
      });
      quiz.nextQuiz();
    }
  }
}
