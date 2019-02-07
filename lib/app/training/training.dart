import 'package:flutter/material.dart';
import 'package:tp3/app/training/question.dart';
import 'package:tp3/util/dimensions.dart';

class Training extends StatefulWidget {
  State<StatefulWidget> createState() => TrainingState();
}

class TrainingState extends State<Training> {
  Question question;

  TrainingState() {
    getNewQuestion();
  }

  void getNewQuestion() {
    question = Question();
    question.generate();
  }

  void onRightAnswerAnswered() {
    getNewQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(PaddingLarge),
              child: FittedBox(
                child: Text(question.letter),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingNormal),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: FlatButton(
                    onPressed: question.answers[0].hasBeenAnswered
                        ? null
                        : () => setState(() {
                              question.answerQuestion(onRightAnswerAnswered, 0);
                            }),
                    child: Text(
                      question.answers[0].answer,
                      style: TextStyle(
                          color: !question.answers[0].hasBeenAnswered
                              ? Colors.black
                              : Colors.red),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: FlatButton(
                    onPressed: question.answers[1].hasBeenAnswered
                        ? null
                        : () => setState(() {
                              question.answerQuestion(onRightAnswerAnswered, 1);
                            }),
                    child: Text(
                      question.answers[1].answer,
                      style: TextStyle(
                          color: !question.answers[1].hasBeenAnswered
                              ? Colors.black
                              : Colors.red),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: FlatButton(
                  onPressed: question.answers[2].hasBeenAnswered
                      ? null
                      : () => setState(() {
                            question.answerQuestion(onRightAnswerAnswered, 2);
                          }),
                  child: Text(
                    question.answers[2].answer,
                    style: TextStyle(
                        color: !question.answers[2].hasBeenAnswered
                            ? Colors.black
                            : Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
