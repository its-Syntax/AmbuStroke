import 'package:flutter/material.dart';

import '../core/models/survey_answer_sheet.dart';
import '../data/nihss_questions.dart';
import '../utils/category_color.dart';

class ResultView extends StatelessWidget {
  final SurveyAnswerSheet sheet;
  const ResultView({super.key, required this.sheet});

  @override
  Widget build(BuildContext context) {
    final total = sheet.total;
    final category = sheet.category;
    final c = categoryColor(category);
    final bg = c.withValues(alpha: 0.22);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: c, width: 2),
              ),
              child: Column(
                children: [
                  Text('Total NIHSS-score', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Text('$total', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(category, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: sheet.answers.entries.map((e) {
                  final q = nihssQuestions.firstWhere((x) => x.id == e.key);
                  final score = e.value;
                  final isFlagged = score > 0;
                  final primary = Theme.of(context).colorScheme.primary;
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: isFlagged
                        ? BoxDecoration(
                            color: primary.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: primary, width: 2),
                          )
                        : null,
                    child: ListTile(
                      shape: isFlagged ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) : null,
                      leading: isFlagged
                          ? Icon(Icons.warning_amber_rounded, color: primary)
                          : const Icon(Icons.check_circle_outline, color: Colors.grey),
                      title: Text('${q.id} – ${q.title}'),
                      trailing: Text(
                        '$score',
                        style: isFlagged
                            ? const TextStyle(fontWeight: FontWeight.bold).copyWith(color: primary)
                            : const TextStyle(color: Colors.black54),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
              icon: const Icon(Icons.home_rounded),
              label: const Text('Til startsiden'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

