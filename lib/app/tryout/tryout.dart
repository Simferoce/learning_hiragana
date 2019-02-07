import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';
import 'package:tp3/util/dimensions.dart';

class Tryout extends StatefulWidget {
  State<StatefulWidget> createState() => TryoutState();
}

class TryoutState extends State<Tryout> {
  Question question = Question();

  TryoutState() {
    question.generate();
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
                child: RawMaterialButton(
                    child: Text(question.answers[0], textScaleFactor: FontScaleDisplay1),
                    onPressed: () {
                      onButtonPressed(0);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: RawMaterialButton(
                    child: Text(question.answers[1], textScaleFactor: FontScaleDisplay1),
                    onPressed: () {
                      onButtonPressed(1);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: RawMaterialButton(
                    child: Text(question.answers[2], textScaleFactor: FontScaleDisplay1,),
                    onPressed: () {
                      onButtonPressed(2);
                    }),
              )
            ],
          ),
        ) //Text("TEST")
      ],
    );
  }

  onButtonPressed(int index) {}
}

class Question {
  static const _NUMBER_OF_POSSIBLE_ANSWERS = 3;

  final _random = Random();
  final answers = [];

  String letter;

  Question() {
    answers.length = _NUMBER_OF_POSSIBLE_ANSWERS;
  }

  generate() {
    int rightAnswerIndex = _random.nextInt(Hiraganas.length);
    int rightAnswerPosition = _random.nextInt(_NUMBER_OF_POSSIBLE_ANSWERS);

    letter = Hiraganas.keys.elementAt(rightAnswerIndex);
    for (int i = 0; i < _NUMBER_OF_POSSIBLE_ANSWERS; i++) {
      if (i == rightAnswerPosition) {
        answers[i] = Hiraganas.values.elementAt(rightAnswerIndex);
      } else {
        answers[i] =
            Hiraganas.values.elementAt(_random.nextInt(Hiraganas.length));
      }
    }
  }
}
