import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'history_view.dart';
import 'survey_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.local_hospital),
            SizedBox(width: 8),
            Text('NIHSS – Ambulanse', style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFFAF9F6)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/brain_logo.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Nevrologisk\nundersøkelse (NIHSS)',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bruk denne appen til å starte en ny NIHSS-vurdering eller se tidligere resultater.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('Start ny undersøkelse', style: TextStyle(fontSize: 18)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SurveyView()),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.history_rounded),
                    label: const Text('Se tidligere undersøkelser', style: TextStyle(fontSize: 18)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const HistoryView()),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Hva er NIHSS?'),
                          content: const SingleChildScrollView(
                            child: Text(
                              'NIHSS (National Institutes of Health Stroke Scale) er et standardisert verktøy for å vurdere alvorlighetsgraden av et hjerneslag. '
                              'Skåren beregnes ved å summere poeng fra flere kliniske undersøkelser, som bevissthetsnivå, blikk, syn, ansikt, motorikk, språk m.m.\n\n'
                              'Formålet med denne appen er å støtte ambulansepersonell i å gjennomføre NIHSS raskt og konsistent i prehospital fase. '
                              'Appen veileder gjennom hvert punkt, summerer poeng og lagrer tidligere undersøkelser for oversikt.\n\n'
                              'Merk: Appen er et beslutningsstøtteverktøy og erstatter ikke klinisk vurdering eller medisinske retningslinjer. Følg alltid lokale prosedyrer.',
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Lukk')),
                          ],
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.ambulanceGreen,
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    child: const Text('Les mer om NIHSS'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
