import '../core/models/survey_answer_sheet.dart';
import '../data/nihss_questions.dart';

class SurveyViewModel {
  final Map<String, int> _answers = {};
  int _index = 0;
  final DateTime _started = DateTime.now();

  int get index => _index;
  int get totalQuestions => nihssQuestions.length;
  Map<String, int> get answers => Map.unmodifiable(_answers);

  void select(int score) {
    _answers[currentQuestionId] = score;
  }

  void next() {
    if (_index < totalQuestions - 1) _index++;
  }

  void prev() {
    if (_index > 0) _index--;
  }

  String get currentQuestionId => nihssQuestions[_index].id;
  int? get selectedScore => _answers[currentQuestionId];
  int get runningTotal => _answers.values.fold(0, (a, b) => a + b);

  bool get isLast => _index == totalQuestions - 1;

  SurveyAnswerSheet finish() {
    return SurveyAnswerSheet(
      answers: Map.of(_answers),
      startedAt: _started,
      completedAt: DateTime.now(),
    );
  }
}

