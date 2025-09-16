import '../core/models/answer_option.dart';
import '../core/models/question.dart';

const List<NihssQuestion> nihssQuestions = [
  NihssQuestion(
    id: '1a',
    title: 'Bevissthetsnivå',
    description: 'Vurder våkenhet og respons på stimuli.',
    options: [
      AnswerOption(label: 'Våken', score: 0),
      AnswerOption(label: 'Ikke våken, men vekkes av tilsnakk/lett berøring', score: 1),
      AnswerOption(label: 'Krever gjentatt/smertefull stimuli for å vekkes', score: 2),
      AnswerOption(label: 'Utelukkende refleksbevegelser/ingen respons', score: 3),
    ],
  ),
  NihssQuestion(
    id: '1b',
    title: 'Spørsmål (måned og alder)',
    description: 'Riktig svar på to enkle spørsmål.',
    options: [
      AnswerOption(label: 'Begge riktige', score: 0),
      AnswerOption(label: 'Én riktig', score: 1),
      AnswerOption(label: 'Ingen riktige', score: 2),
    ],
  ),
  NihssQuestion(
    id: '1c',
    title: 'Kommandoer',
    description: 'Utfør to enkle kommandoer (f.eks. åpne/lukke øyne, knytte/slippe hånd).',
    options: [
      AnswerOption(label: 'Begge utført korrekt', score: 0),
      AnswerOption(label: 'Én utført korrekt', score: 1),
      AnswerOption(label: 'Ingen utført korrekt', score: 2),
    ],
  ),
  NihssQuestion(
    id: '2',
    title: 'Blikk',
    description: 'Beste blikkretning.',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Delvis blikkparese', score: 1),
      AnswerOption(label: 'Total blikkparese (tvangsdeviasjon)', score: 2),
    ],
  ),
  NihssQuestion(
    id: '3',
    title: 'Synsfelt',
    description: 'Undersøk kvadranter for hemianopsi.',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Delvis hemianopsi', score: 1),
      AnswerOption(label: 'Komplett hemianopsi', score: 2),
      AnswerOption(label: 'Bilateral blindhet', score: 3),
    ],
  ),
  NihssQuestion(
    id: '4',
    title: 'Ansiktslammelse',
    options: [
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
    options: [
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
    options: [
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
    options: [
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
    options: [
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
    options: [
      AnswerOption(label: 'Ingen', score: 0),
      AnswerOption(label: 'I én ekstremitet', score: 1),
      AnswerOption(label: 'I to ekstremiteter', score: 2),
    ],
  ),
  NihssQuestion(
    id: '8',
    title: 'Sensibilitet',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Lett-moderat nedsatt', score: 1),
      AnswerOption(label: 'Alvorlig nedsatt/ingen følelse', score: 2),
    ],
  ),
  NihssQuestion(
    id: '9',
    title: 'Språk (afasi)',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild-moderat afasi', score: 1),
      AnswerOption(label: 'Alvorlig afasi', score: 2),
      AnswerOption(label: 'Stum/global afasi', score: 3),
    ],
  ),
  NihssQuestion(
    id: '10',
    title: 'Dysartri (tale)',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild-moderat dysartri', score: 1),
      AnswerOption(label: 'Alvorlig dysartri/ujevn', score: 2),
    ],
  ),
  NihssQuestion(
    id: '11',
    title: 'Neglekt (ekstinksjon/uvraksomhet)',
    options: [
      AnswerOption(label: 'Ingen', score: 0),
      AnswerOption(label: 'Delvis', score: 1),
      AnswerOption(label: 'Total', score: 2),
    ],
  ),
];

