// Модель данных
class Questionnaire {
  final int fillPercent;

  const Questionnaire(this.fillPercent);

  bool get isNotStarted => fillPercent == 0;
  bool get isInProgress => fillPercent > 0 && fillPercent < 100;
  bool get isCompleted => fillPercent == 100;
}



