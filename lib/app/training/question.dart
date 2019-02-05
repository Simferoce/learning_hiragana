import 'dart:math';

import 'package:tp3/app/hiragana/hiragana.dart';

class Answer {
  String answer = "";
  bool hasBeenAnswered = false;

  Answer(this.answer);
}

class Question {
  static const _NUMBER_OF_POSSIBLE_ANSWERS = 3;

  final _random = Random();
  final answers = [];
  int rightAnswerPosition;

  String letter;

  Question() {
    answers.length = _NUMBER_OF_POSSIBLE_ANSWERS;
  }

  generate() {
    int rightAnswerIndex = _random.nextInt(Hiraganas.length);
    rightAnswerPosition = _random.nextInt(_NUMBER_OF_POSSIBLE_ANSWERS);

    letter = Hiraganas.keys.elementAt(rightAnswerIndex);
    for (int i = 0; i < _NUMBER_OF_POSSIBLE_ANSWERS; i++) {
      if (i == rightAnswerPosition) {
        answers[i] = Answer(Hiraganas.values.elementAt(rightAnswerIndex));
      } else {
        int _randomIndex;
        int _tryRandom = 0;
        do {
          _randomIndex = _random.nextInt(Hiraganas.length);
          _tryRandom++;
        } while (_randomIndex == rightAnswerIndex && _tryRandom < 5);

        answers[i] = Answer(Hiraganas.values.elementAt(_randomIndex));
      }
    }
  }

  void answerQuestion(Function() onRightAnswer, int index) {
    if (index == rightAnswerPosition) {
      onRightAnswer();
    }

    answers[index].hasBeenAnswered = true;
  }
}


