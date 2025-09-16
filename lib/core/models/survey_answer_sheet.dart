class SurveyAnswerSheet {
  final Map<String, int> answers; // id -> score
  final DateTime startedAt;
  final DateTime completedAt;

  SurveyAnswerSheet({
    required this.answers,
    required this.startedAt,
    required this.completedAt,
  });

  int get total => answers.values.fold(0, (a, b) => a + b);

  String get category {
    final t = total;
    if (t == 0) return 'Ingen funn';
    if (t <= 4) return 'Mildt';
    if (t <= 15) return 'Moderat';
    if (t <= 20) return 'Moderat–alvorlig';
    return 'Alvorlig';
  }

  Map<String, dynamic> toJson() => {
        'answers': answers,
        'startedAt': startedAt.toIso8601String(),
        'completedAt': completedAt.toIso8601String(),
      };

  static SurveyAnswerSheet fromJson(Map<String, dynamic> json) => SurveyAnswerSheet(
        answers: (json['answers'] as Map).map((k, v) => MapEntry(k.toString(), v as int)),
        startedAt: DateTime.parse(json['startedAt'] as String),
        completedAt: DateTime.parse(json['completedAt'] as String),
      );
}

