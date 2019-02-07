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
    for (int i = 0; i < answers.length; ++i) answers[i] = Answer("");
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
        } while ((_randomIndex == rightAnswerIndex ||
                -1 !=
                    answers.indexWhere((answer) =>
                        answer.answer !=
                        Hiraganas.values.elementAt(_randomIndex))) &&
            _tryRandom < 5);

        answers[i] = Answer(Hiraganas.values.elementAt(_randomIndex));
      }
    }
  }

  void answerQuestion(Function() onRightAnswer, Function() onWrongAnswer, int index) {
    if (index == rightAnswerPosition) {
      onRightAnswer();
    }
    else {
      onWrongAnswer();
    }

    answers[index].hasBeenAnswered = true;
  }
}
