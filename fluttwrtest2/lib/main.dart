import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'questionnaire_ui.dart';
import 'questionnaire_bloc.dart';
import 'questionnaire_repository.dart';

/*
Существует некий опросник, который может быть получен по сети. Опросник может быть не заполненным, в процесссе заполнения и полностью заполненным.
Необходимо написать блок для получения информации об опроснике и вывести его состояние на экран (просто текстом).
Использовать паттерн repository, методы получения сделать как обычные заглушки с моканными данными.
Опросник представляет собой сущность с одним полем - процент заполнения.
*/

void main() => runApp(
  MaterialApp(
    home: BlocProvider(
      create: (_) => QuestionnaireBloc(MockQuestionnaireRepository()),
      child: QuestionnaireScreen(),
    ),
  ),
);