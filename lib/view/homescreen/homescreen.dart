import 'package:flutter/material.dart';

import 'package:quizapp/view/dummydb.dart';
import 'package:quizapp/view/optioncard.dart';
import 'package:quizapp/view/resultscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.passindex = 0,
  });
  final int passindex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int questionIndex = 0;
  int? answerIndex;
  int rightAnswerCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff16325B),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              //QuestionDisplyScreen

              _buildQuestionSection(widget.passindex),

              const SizedBox(
                height: 30,
              ),

              //Options

              Column(
                children: List.generate(
                  4,
                  (index) => Optioncard(
                    onTap: () {
                      if (answerIndex == null) {
                        setState(() {
                          answerIndex = index;
                        });
                        if (answerIndex ==
                            DummyDb.categorizedQuestions[widget.passindex]
                                [questionIndex]['answer']) {
                          rightAnswerCount++;
                        }
                      }
                    },
                    questionIndex: questionIndex,
                    optionindex: index,
                    passindex: widget.passindex,
                    answerindex: answerIndex,
                    icondata: getIcon(index),
                    col: getColor(index),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: answerIndex == null
            ? null
            : InkWell(
                onTap: () {
                  if (questionIndex <
                      DummyDb.categorizedQuestions[widget.passindex].length -
                          1) {
                    answerIndex = null;

                    setState(() {
                      questionIndex++;
                    });
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Resultscreen(
                            passIndex: widget.passindex,
                            correctAns: rightAnswerCount,
                          ),
                        ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff227B94),
                    ),
                    child: const Center(
                      child: Text('Next',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                  ),
                ),
              ));
  }

  Color getColor(int index) {
    if (answerIndex != null) {
      if (index ==
          DummyDb.categorizedQuestions[widget.passindex][questionIndex]
              ['answer']) {
        return Colors.green;
      }
      if (answerIndex == index) {
        if (answerIndex ==
            DummyDb.categorizedQuestions[widget.passindex][questionIndex]
                ['answer']) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      }
    }
    return Colors.white;
  }

  IconData getIcon(int index) {
    if (answerIndex != null) {
      if (index ==
          DummyDb.categorizedQuestions[widget.passindex][questionIndex]
              ['answer']) {
        return Icons.check_circle;
      }
      if (answerIndex == index) {
        if (answerIndex ==
            DummyDb.categorizedQuestions[widget.passindex][questionIndex]
                ['answer']) {
          return Icons.check_circle;
        } else {
          return Icons.cancel;
        }
      }
    }
    return Icons.circle_outlined;
  }

  Widget _buildQuestionSection(int passindex) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0xff227B94),
        ),
        child: Center(
          child: Text(
            DummyDb.categorizedQuestions[widget.passindex][questionIndex]
                ['question'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
