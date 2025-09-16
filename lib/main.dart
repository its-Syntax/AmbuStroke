import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NihssApp());
}

class NihssApp extends StatelessWidget {
  const NihssApp({super.key});

  static const Color ambulanceGreen = Color(0xFF2d7f57);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ambulanceGreen),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'NIHSS',
      theme: base.copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: ambulanceGreen,
          foregroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ambulanceGreen,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: ambulanceGreen,
            side: const BorderSide(width: 2, color: ambulanceGreen),
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.local_hospital, color: Colors.white),
            SizedBox(width: 8),
            Text(
            'NIHSS – Ambulanse',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _HeaderStripe(),
              const SizedBox(height: 24),
              Text(
                'Nevrologisk undersøkelse (NIHSS)',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Bruk denne appen til å starte en ny NIHSS-vurdering eller se tidligere resulatater.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text(
                  'Start ny undersøkelse',
                  style: TextStyle(fontSize: 18)
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SurveyPage(prefs: prefs),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                icon: const Icon(Icons.history_rounded),
                label: const Text(
                  'Se tidligere undersøkelser',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HistoryPage(prefs: prefs),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderStripe extends StatelessWidget {
  const _HeaderStripe();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: NihssApp.ambulanceGreen,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _ChevronPainter(color: NihssApp.ambulanceGreen),
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.local_hospital, color: Colors.black87),
                SizedBox(width: 8),
                Text(
                  'AMBULANSE',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChevronPainter extends CustomPainter {
  final Color color;
  const _ChevronPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withValues(alpha: 0.12);
    final path = Path();
    final step = size.width / 10;
    for (int i = -2; i < 12; i++) {
      final x = i * step;
      path.reset();
      path.moveTo(x.toDouble(), 0);
      path.lineTo((x + step / 2).toDouble(), size.height);
      path.lineTo((x + step).toDouble(), 0);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------- Survey models and data ----------------

class AnswerOption {
  final String label;
  final int score;
  const AnswerOption({required this.label, required this.score});
}

class NihssQuestion {
  final String id; // e.g., '1a'
  final String title; // e.g., 'Bevissthetsnivå'
  final String? description;
  final List<AnswerOption> options;

  const NihssQuestion({
    required this.id,
    required this.title,
    required this.options,
    this.description,
  });
}

final List<NihssQuestion> kQuestions = [
  NihssQuestion(
    id: '1a',
    title: 'Bevissthetsnivå',
    description: 'Vurder våkenhet og respons på stimuli.',
    options: const [
      AnswerOption(label: 'Våken', score: 0),
      AnswerOption(label: 'Ikke våken, men vekkes av tilsnakk/lett berøring', score: 1),
      AnswerOption(label: 'Krever gjentatt/painful stimuli for å vekkes', score: 2),
      AnswerOption(label: 'Utelukkende refleksbevegelser/ingen respons', score: 3),
    ],
  ),
  NihssQuestion(
    id: '1b',
    title: 'Spørsmål (måned og alder)',
    description: 'Riktig svar på to enkle spørsmål.',
    options: const [
      AnswerOption(label: 'Begge riktige', score: 0),
      AnswerOption(label: 'Ett riktig', score: 1),
      AnswerOption(label: 'Ingen riktige', score: 2),
    ],
  ),
  NihssQuestion(
    id: '1c',
    title: 'Kommandoer',
    description: 'Utfør to enkle kommandoer (f.eks. åpne/lukke øyne, knytte/slippe hånd).',
    options: const [
      AnswerOption(label: 'Begge utført korrekt', score: 0),
      AnswerOption(label: 'Én utført korrekt', score: 1),
      AnswerOption(label: 'Ingen utført korrekt', score: 2),
    ],
  ),
  NihssQuestion(
    id: '2',
    title: 'Blikk',
    description: 'Beste blikkretning.',
    options: const [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Delvis blikkparese', score: 1),
      AnswerOption(label: 'Total blikkparese (tvangsdeviasjon)', score: 2),
    ],
  ),
  NihssQuestion(
    id: '3',
    title: 'Synsfelt',
    description: 'Undersøk kvadranter for hemianopsi.',
    options: const [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Delvis hemianopsi', score: 1),
      AnswerOption(label: 'Komplett hemianopsi', score: 2),
      AnswerOption(label: 'Bilateral blindhet', score: 3),
    ],
  ),
  NihssQuestion(
    id: '4',
    title: 'Ansiktslammelse',
    options: const [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild (nasolabial flatning)', score: 1),
      AnswerOption(label: 'Delvis parese', score: 2),
      AnswerOption(label: 'Total parese', score: 3),
    ],
  ),
  NihssQuestion(
    id: '5a',
    title: 'Motorikk arm – venstre',
    description: 'Hold armen 10 sek. i 90° (sittende) eller 45° (liggende).',
    options: const [
      AnswerOption(label: 'Ingen drift', score: 0),
      AnswerOption(label: 'Drift < 10 sek', score: 1),
      AnswerOption(label: 'Sporer under 10 sek', score: 2),
      AnswerOption(label: 'Liten bevegelse', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '5b',
    title: 'Motorikk arm – høyre',
    description: 'Hold armen 10 sek. i 90° (sittende) eller 45° (liggende).',
    options: const [
      AnswerOption(label: 'Ingen drift', score: 0),
      AnswerOption(label: 'Drift < 10 sek', score: 1),
      AnswerOption(label: 'Sporer under 10 sek', score: 2),
      AnswerOption(label: 'Liten bevegelse', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '6a',
    title: 'Motorikk ben – venstre',
    description: 'Hold benet 5 sek. i 30° (liggende).',
    options: const [
      AnswerOption(label: 'Ingen drift', score: 0),
      AnswerOption(label: 'Drift < 5 sek', score: 1),
      AnswerOption(label: 'Sporer under 5 sek', score: 2),
      AnswerOption(label: 'Liten bevegelse', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '6b',
    title: 'Motorikk ben – høyre',
    description: 'Hold benet 5 sek. i 30° (liggende).',
    options: const [
      AnswerOption(label: 'Ingen drift', score: 0),
      AnswerOption(label: 'Drift < 5 sek', score: 1),
      AnswerOption(label: 'Sporer under 5 sek', score: 2),
      AnswerOption(label: 'Liten bevegelse', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '7',
    title: 'Ataksi (lemmer)',
    options: const [
      AnswerOption(label: 'Ingen', score: 0),
      AnswerOption(label: 'I én ekstremitet', score: 1),
      AnswerOption(label: 'I to ekstremiteter', score: 2),
    ],
  ),
  NihssQuestion(
    id: '8',
    title: 'Sensibilitet',
    options: const [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Lett-moderat nedsatt', score: 1),
      AnswerOption(label: 'Alvorlig nedsatt/ingen følelse', score: 2),
    ],
  ),
  NihssQuestion(
    id: '9',
    title: 'Språk (afasi)',
    options: const [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild-moderat afasi', score: 1),
      AnswerOption(label: 'Alvorlig afasi', score: 2),
      AnswerOption(label: 'Stum/global afasi', score: 3),
    ],
  ),
  NihssQuestion(
    id: '10',
    title: 'Dysartri (tale)',
    options: const [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild-moderat dysartri', score: 1),
      AnswerOption(label: 'Alvorlig dysartri/ujevn', score: 2),
    ],
  ),
  NihssQuestion(
    id: '11',
    title: 'Neglekt (ekstinksjon/uvraksomhet)',
    options: const [
      AnswerOption(label: 'Ingen', score: 0),
      AnswerOption(label: 'Delvis', score: 1),
      AnswerOption(label: 'Total', score: 2),
    ],
  ),
];

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

// ---------------- Survey page ----------------

class SurveyPage extends StatefulWidget {
  final SharedPreferences prefs;
  const SurveyPage({super.key, required this.prefs});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final Map<String, int> _answers = {};
  int _index = 0;
  late final DateTime _started = DateTime.now();

  void _select(int score) {
    final q = kQuestions[_index];
    setState(() => _answers[q.id] = score);
  }

  void _next() {
    if (_index < kQuestions.length - 1) {
      setState(() => _index++);
    } else {
      _finish();
    }
  }

  void _prev() {
    if (_index > 0) setState(() => _index--);
  }

  Future<void> _finish() async {
    final sheet = SurveyAnswerSheet(
      answers: Map.of(_answers),
      startedAt: _started,
      completedAt: DateTime.now(),
    );
    await _saveSurvey(widget.prefs, sheet);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResultPage(sheet: sheet),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = kQuestions[_index];
    final selectedScore = _answers[q.id];
    final totalSelected = _answers.values.fold(0, (a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: Text('Spørsmål ${_index + 1} av ${kQuestions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(q.id, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(
              q.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
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
                          color: selected ? NihssApp.ambulanceGreen : Colors.grey.shade300,
                          width: 2,
                        ),
                        color: selected ? NihssApp.ambulanceGreen.withValues(alpha: 0.08) : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: selected ? NihssApp.ambulanceGreen : Colors.grey,
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
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _index > 0 ? _prev : null,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Tilbake'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: selectedScore != null ? _next : null,
                    icon: Icon(_index == kQuestions.length - 1 ? Icons.flag : Icons.chevron_right),
                    label: Text(_index == kQuestions.length - 1 ? 'Fullfør' : 'Neste'),
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

// ---------------- Result page ----------------

class ResultPage extends StatelessWidget {
  final SurveyAnswerSheet sheet;
  const ResultPage({super.key, required this.sheet});

  @override
  Widget build(BuildContext context) {
    final total = sheet.total;
    final category = sheet.category;

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
                color: NihssApp.ambulanceGreen.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: NihssApp.ambulanceGreen, width: 2),
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
                  final q = kQuestions.firstWhere((x) => x.id == e.key);
                  return ListTile(
                    title: Text('${q.id} – ${q.title}'),
                    trailing: Text('+${e.value}'),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
              icon: const Icon(Icons.home_rounded),
              label: const Text('Til startsiden'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- History page ----------------

class HistoryPage extends StatefulWidget {
  final SharedPreferences prefs;
  const HistoryPage({super.key, required this.prefs});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<SurveyAnswerSheet> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _items = await loadSurveys(widget.prefs);
    setState(() {});
  }

  Future<void> _clear() async {
    await widget.prefs.remove('surveys');
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tidligere undersøkelser'),
        actions: [
          IconButton(
            tooltip: 'Tøm historikk',
            icon: const Icon(Icons.delete_forever),
            onPressed: _items.isEmpty
                ? null
                : () async {
                    final ok = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Tøm historikk?'),
                        content: const Text('Dette vil fjerne alle lagrede undersøkelser.'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Avbryt')),
                          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Tøm')),
                        ],
                      ),
                    );
                    if (ok == true) await _clear();
                  },
          ),
        ],
      ),
      body: _items.isEmpty
          ? const Center(child: Text('Ingen undersøkelser lagret ennå.'))
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: _items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final s = _items[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: NihssApp.ambulanceGreen,
                    foregroundColor: Colors.white,
                    child: Text('${s.total}'),
                  ),
                  title: Text('NIHSS: ${s.total} – ${s.category}'),
                  subtitle: Text(
                    '${_fmt(s.completedAt)}  (startet ${_fmt(s.startedAt)})',
                  ),
                );
              },
            ),
    );
  }
}

String _fmt(DateTime dt) {
  final y = dt.year.toString().padLeft(4, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  final hh = dt.hour.toString().padLeft(2, '0');
  final mm = dt.minute.toString().padLeft(2, '0');
  return '$d.$m.$y kl $hh:$mm';
}

// ---------------- Storage helpers ----------------

Future<void> _saveSurvey(SharedPreferences prefs, SurveyAnswerSheet sheet) async {
  final list = await loadRawList(prefs);
  list.add(sheet.toJson());
  await prefs.setString('surveys', jsonEncode(list));
}

Future<List<SurveyAnswerSheet>> loadSurveys(SharedPreferences prefs) async {
  final list = await loadRawList(prefs);
  return list.map((e) => SurveyAnswerSheet.fromJson(e)).toList().reversed.toList();
}

Future<List<Map<String, dynamic>>> loadRawList(SharedPreferences prefs) async {
  final s = prefs.getString('surveys');
  if (s == null || s.isEmpty) return <Map<String, dynamic>>[];
  final raw = jsonDecode(s) as List;
  return raw
      .cast<Map>()
      .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
      .cast<Map<String, dynamic>>()
      .toList();
}
