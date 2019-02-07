import 'package:flutter/material.dart';
import 'package:tp3/app/training/question.dart';
import 'package:tp3/util/dimensions.dart';
import 'package:tp3/util/strings.dart';

class Training extends StatefulWidget {
  State<StatefulWidget> createState() => TrainingState();
}

class TrainingState extends State<Training> {
  static const int MAX_HEALTH = 3;

  Question question = Question();
  int score = 0;
  int health = MAX_HEALTH;

  TrainingState() {
    question.generate();
  }

  void onRightAnswerAnswered() {
    score++;
    question = Question();
    question.generate();
  }

  Future onWrongAnswerTried() async {
    health--;

    if (health <= 0) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text(Strings.of(context).game_over),
              actions: <Widget>[
                FlatButton(
                  child: Text(Strings.of(context).ok),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            );
          }).then((val) {
            setState(() {
              health = MAX_HEALTH;
              score = 0;
              question = Question();
              question.generate();
            });
      });
    }
  }

  List<Widget> generateHealthPoints() {
    List<Widget> widgets = List<Widget>();
    for (int i = 0; i < health; i++) {
      widgets.add(Icon(Icons.favorite));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(PaddingNormal),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                Strings.of(context).score(score),
              )),
              Row(
                children: generateHealthPoints(),
              )
            ],
          ),
        ),

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
                              question.answerQuestion(
                                  onRightAnswerAnswered, onWrongAnswerTried, 0);
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
                              question.answerQuestion(
                                  onRightAnswerAnswered, onWrongAnswerTried, 1);
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
                              question.answerQuestion(
                                  onRightAnswerAnswered, onWrongAnswerTried, 2);
                            }),
                    child: Text(
                      question.answers[2].answer,
                      style: TextStyle(
                          color: !question.answers[2].hasBeenAnswered
                              ? Colors.black
                              : Colors.red),
                    )),
              )
            ],
          ),
        ) //Text("TEST")
      ],
    );
  }
}
