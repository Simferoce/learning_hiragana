import 'package:flutter/material.dart';

Map<String, Map<String, dynamic>> StringValues = {
  'en': {
    'title': 'Hiraganas',
    'learn': 'Learn',
    'train': 'Train',
    'game_over': 'Game over',
    'ok': 'Ok',
    'score': (int nb) => 'Score: $nb',
  },
  'fr': {
    'title': 'Hiraganas',
    'learn': 'Apprendre',
    'train': 'Entrainement',
    'game_over': 'Partie finie',
    'ok' : 'Ok',
    'score': (int nb) => 'Pointage: $nb',
  },
};

class Strings {
  String get title => StringValues[_languageCode]['title'];

  String get learn => StringValues[_languageCode]['learn'];

  String get train => StringValues[_languageCode]['train'];

  String get game_over => StringValues[_languageCode]['game_over'];

  String get ok => StringValues[_languageCode]['ok'];

  String score(int nb) => StringValues[_languageCode]['score'](nb);



  //****************************************************
  //Implementation details. Mostly boilerplate code.
  //****************************************************

  final String _languageCode;

  Strings(Locale locale) : _languageCode = locale.languageCode;

  static Strings of(BuildContext context) =>
      Localizations.of<Strings>(context, Strings);
}
