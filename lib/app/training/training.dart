import 'package:flutter/material.dart';
import 'package:tp3/app/training/question.dart';
import 'package:tp3/util/dimensions.dart';

final NUMBER_OF_CHOICE_BUTTONS = 3;

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
            children: buildChoiceButtons(NUMBER_OF_CHOICE_BUTTONS),
          ),
        ),
      ],
    );
  }

  List<Widget> buildChoiceButtons(int numberOfButton) {
    List<Widget> buttons = List<Widget>();
    for(int i = 0; i < numberOfButton; ++i) {
      buttons.add(buildChoiceButton(i));
    }

    return buttons;
  }

  Padding buildChoiceButton(int index) {
    return Padding(
              padding: const EdgeInsets.all(0),
              child: FlatButton(
                  onPressed: question.answers[index].hasBeenAnswered
                      ? null
                      : () => setState(() {
                            question.answerQuestion(onRightAnswerAnswered, index);
                          }),
                  child: Text(
                    question.answers[index].answer,
                    style: TextStyle(
                        color: !question.answers[index].hasBeenAnswered
                            ? Colors.black
                            : Colors.red),
                  )),
            );
  }
}
