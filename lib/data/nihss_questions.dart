import '../core/models/answer_option.dart';
import '../core/models/question.dart';

const List<NihssQuestion> nihssQuestions = [
  NihssQuestion(
    id: '1a',
    title: 'Bevissthetsnivå',
    description: 'Vurder våkenhet og respons på stimuli.',
    guidance:
        'Vurder om pasienten er våken og oppmerksom. Hvis ikke, vurder respons på verbal/pågående stimuli og eventuelt smerte. '
        'Skår etter beste respons. Ikke bruk sedasjon under vurderingen.',
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
    guidance:
        'Still to enkle spørsmål: nåværende måned og pasientens alder. '
        'Skår 0 hvis begge riktige, 1 hvis ett riktig, 2 hvis ingen. Ikke gi hint og ikke gjenta mer enn nødvendig.',
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
    guidance:
        'Gi to enkle kommandoer, for eksempel: “Åpne og lukk øynene” og “Knytt og slipp hånden”. '
        'Skår etter antall korrekt utførte handlinger uten veiledning eller demonstasjon.',
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
    guidance:
        'Undersøk spontan blikkstilling og evne til lateral blikkdevisjon. '
        'Vurder for parese eller tvangsdeviasjon. Skår etter beste blikkbevegelse.',
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
    guidance:
        'Test synsfelt ved konfrontasjon: be pasienten se på din nese og angi når de ser fingre i perifert syn. '
        'Skår basert på tap i kvadranter/halvfelt. Ved blindhet skåres 3.',
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
    guidance:
        'Be pasienten vise tenner, løfte øyenbryn og knipe øyne. '
        'Vurder asymmetri og graden av parese i ansiktet.',
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
    guidance:
        'Be pasienten løfte venstre arm til 90° (sittende) eller 45° (liggende) i 10 sekunder. '
        'Skår drift, ikke motstand mot tyngdekraft hvis ikke holdes.',
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
    guidance:
        'Samme som 5a for høyre arm. Skår etter tydelig drift innen 10 sekunder eller manglende bevegelse.',
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
    guidance:
        'Be pasienten løfte venstre ben 30° i 5 sekunder (liggende). '
        'Skår drift eller manglende evne til å holde benet løftet.',
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
    guidance: 'Som 6a for høyre ben.',
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
    guidance:
        'Test finger-til-nese og hæl-til-kne for koordinasjon. '
        'Skår kun cerebellær ataksi, ikke svakhet eller sensorisk svikt.',
    options: [
      AnswerOption(label: 'Ingen', score: 0),
      AnswerOption(label: 'I én ekstremitet', score: 1),
      AnswerOption(label: 'I to ekstremiteter', score: 2),
    ],
  ),
  NihssQuestion(
    id: '8',
    title: 'Sensibilitet',
    guidance:
        'Test respons på lett berøring og/eller pinprick på begge sider av kroppen. '
        'Skår for redusert eller fraværende følelse. Unngå å overtolke smerterespons.',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Lett-moderat nedsatt', score: 1),
      AnswerOption(label: 'Alvorlig nedsatt/ingen følelse', score: 2),
    ],
  ),
  NihssQuestion(
    id: '9',
    title: 'Språk (afasi)',
    guidance:
        'Vurder forståelse, benevning, repetisjon og spontan tale. '
        'Bruk enkle oppgaver. Skår etter grad av afasi, ikke dysartri.',
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
    guidance:
        'Vurder uttale ved å la pasienten lese/ gjenta ord eller fraser. '
        'Skår for utydelig tale pga. motorisk talevanske, ikke afasi.',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild-moderat dysartri', score: 1),
      AnswerOption(label: 'Alvorlig dysartri/ujevn', score: 2),
    ],
  ),
  NihssQuestion(
    id: '11',
    title: 'Neglekt (ekstinksjon/uvraksomhet)',
    guidance:
        'Test simultan stimulering på begge sider (berøring/syn/hørsel). '
        'Skår hvis pasienten ignorerer stimuli på affisert side ved samtidig stimulering.',
    options: [
      AnswerOption(label: 'Ingen', score: 0),
      AnswerOption(label: 'Delvis', score: 1),
      AnswerOption(label: 'Total', score: 2),
    ],
  ),
];
