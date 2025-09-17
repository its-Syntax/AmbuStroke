import 'package:flutter/material.dart';

import '../data/nihss_questions.dart';
import '../viewmodels/survey_view_model.dart';
import '../services/storage_service.dart';
import 'result_view.dart';

class SurveyView extends StatefulWidget {
  const SurveyView({super.key});

  @override
  State<SurveyView> createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> {
  late final SurveyViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = SurveyViewModel();
  }

  void _select(int score) {
    setState(() => vm.select(score));
  }

  void _next() {
    if (!vm.isLast) {
      setState(() => vm.next());
    } else {
      final sheet = vm.finish();
      // persist result
      StorageService().save(sheet);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ResultView(sheet: sheet)),
      );
    }
  }

  void _prev() {
    setState(() => vm.prev());
  }

  @override
  Widget build(BuildContext context) {
    final q = nihssQuestions[vm.index];
    final selectedScore = vm.selectedScore;
    final totalSelected = vm.runningTotal;

    return Scaffold(
      appBar: AppBar(title: Text('Spørsmål ${vm.index + 1} av ${vm.totalQuestions}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(q.id, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(q.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            if (q.description != null) ...[
              const SizedBox(height: 6),
              Text(q.description!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87)),
            ],
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: q.options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final opt = q.options[i];
                  final selected = selectedScore == opt.score;
                  return InkWell(
                    onTap: () => _select(opt.score),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
                          width: 2,
                        ),
                        color: selected ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08) : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: selected ? Theme.of(context).colorScheme.primary : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(opt.label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                Text('Poeng: ${opt.score}')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  final text = q.guidance ?? 'Ingen veiledning tilgjengelig for dette punktet.';
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Hvordan utføre vurdering – ${q.id}'),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (q.illustrationAsset != null) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  q.illustrationAsset!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                            Text(text),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Lukk')),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.help_outline),
                label: const Text('Hvordan utføre vurdering'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: vm.index > 0 ? _prev : null,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Tilbake'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: selectedScore != null ? _next : null,
                    icon: Icon(vm.isLast ? Icons.flag : Icons.chevron_right),
                    label: Text(vm.isLast ? 'Fullfør' : 'Neste'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Foreløpig sum: $totalSelected', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

