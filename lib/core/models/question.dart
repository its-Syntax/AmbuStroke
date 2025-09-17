import 'answer_option.dart';

class NihssQuestion {
  final String id; // e.g., '1a'
  final String title; // e.g., 'Bevissthetsnivå'
  final String? description;
  final String? guidance; // Hvordan utføre vurdering
  final String? illustrationAsset; // Optional asset path to an illustration shown in guidance popup
  final List<AnswerOption> options;

  const NihssQuestion({
    required this.id,
    required this.title,
    required this.options,
    this.description,
    this.guidance,
    this.illustrationAsset,
  });
}

