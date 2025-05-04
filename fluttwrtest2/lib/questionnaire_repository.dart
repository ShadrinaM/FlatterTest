import 'dart:math';
import 'questionnaire.dart';

// Репозиторий
abstract class QuestionnaireRepository {
  Future<Questionnaire> fetch();
}

class MockQuestionnaireRepository implements QuestionnaireRepository {
  final Random _random = Random();

  @override
  Future<Questionnaire> fetch() async {
    await Future.delayed(Duration(seconds: 1)); // Ожидает выполнения функции (иммитация загрузки данных)

    final randomPercentage = _random.nextInt(101); // Случайное число 0-100
    return Questionnaire(randomPercentage); // Возвращает рандомное значение процентов заполнения формы
  }
}