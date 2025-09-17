import '../core/models/answer_option.dart';
import '../core/models/question.dart';

const List<NihssQuestion> nihssQuestions = [
  NihssQuestion(
    id: '1a',
    title: 'Bevissthetsnivå',
    description: 'Vurder våkenhet og respons på stimuli.',
    guidance:
        'Vurder om pasienten er våken og oppmerksom. Hvis ikke, vurder respons på verbal/pågående stimuli og eventuelt smerte. '
        'Skår etter beste respons.',
    illustrationAsset: 'assets/images/bevissthetsnivå.png',
    options: [
      AnswerOption(label: 'Våken', score: 0),
      AnswerOption(label: 'Døsig, men vekkes av tilsnakk/lett berøring', score: 1),
      AnswerOption(label: 'Døsig, krever gjentatt/smertefull stimuli for å vekkes', score: 2),
      AnswerOption(label: 'Ingen respons', score: 3),
    ],
  ),
  NihssQuestion(
    id: '1b',
    title: 'Orientering',
    description: 'Spør om måned og alder',
    guidance:
        'Still to enkle spørsmål: nåværende måned og pasientens alder. '
        'Skår 0 hvis begge riktige, 1 hvis ett riktig, 2 hvis ingen. Ikke gi hint og ikke gjenta mer enn nødvendig.',
    illustrationAsset: 'assets/images/orientering.png',
    options: [
      AnswerOption(label: 'Svarer riktig på to spørsmål', score: 0),
      AnswerOption(label: 'Svarer riktig på ett spørsmål (eller ved alvorlig dysartri)', score: 1),
      AnswerOption(label: 'Svarer ikke riktig på noe spørsmål', score: 2),
    ],
  ),
  NihssQuestion(
    id: '1c',
    title: 'Respons på kommando',
    description: 'Utfør to enkle kommandoer (lukke øyne + knyte hånd).',
    guidance:
        'Be pasienten åpne øynene og så lukke øynene; deretter knyte hånden og så åpne hånden. '
        'Dersom pasienten gjør et entydig forsøk på å følge kommando, skåres dette som utført. Hvis pasienten ikke reagerer på kommando, kan ønsket respons demonstreres av undersøker.',
    illustrationAsset: 'assets/images/kommando.png',
    options: [
      AnswerOption(label: 'Utfører begge kommandoer korrekt', score: 0),
      AnswerOption(label: 'Utfører en kommando korrekt', score: 1),
      AnswerOption(label: 'Utfører ingen korrekt', score: 2),
    ],
  ),
  NihssQuestion(
    id: '2a',
    title: 'Blikkbevegelse',
    description: 'Test horisontale øyebevegelser.',
    guidance:
        'Test horisontale øyebevegelser, voluntært eller reflektorisk (oculocephal refleks) dersom bevisstløs. '
        'Unormale funn i ett (isolert øyemuskelparese) eller begge øyne skårer 1.\nEn fiksert blikkdreining til siden (som ikke kan overvinnes ved oculocephal manøver) skårer 2.',
    illustrationAsset: 'assets/images/blikkbevegelse.png',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Delvis blikkparese', score: 1),
      AnswerOption(label: 'Fiksert blikkdreining til siden eller total blikkparese', score: 2),
    ],
  ),
  NihssQuestion(
    id: '3a',
    title: 'Synsfelt',
    description: 'Test øvre og nedre laterale synsfelt ved hjelp av fingerbevegelse.',
    guidance:
        'Test øvre og nedre laterale synsfelt ved hjelp av fingerbevegelse, fingertelling eller plutselige bevegelser inn fra siden i synsfeltet.\n'
        'Skår basert på tap i kvadranter/halvfelt. Bortfall i ett kvadrant → delvis hemianopsi. Bortfall i to kvadranter på samme side (hele høyre eller hele venstre halvdel) → total hemianopsi.',
    illustrationAsset: 'assets/images/synsfelt.png',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Delvis hemianopsi', score: 1),
      AnswerOption(label: 'Total hemianopsi', score: 2),
      AnswerOption(label: 'Bilateral hemianopsi / blind', score: 3),
    ],
  ),
  NihssQuestion(
    id: '4a',
    title: 'Ansiktslammelse',
    description: 'Be vise tenner, knipe igjen øynene, løfte øyenbryn',
    guidance:
        'Instruer eller demonstrer å vise tenner, løfte øyenbrynene og lukke øynene.\n'
        'Hos reduserte pasienter eller pasienter som ikke forstår instruksjonene, benyttes reaksjon/grimasering på smertestimuli som grunnlag for scoring. Komatøse pasienter skårer 3.',
    illustrationAsset: 'assets/images/ansikt.png',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Asymmetri ved smil\n(Utvisket nasolabialfure)', score: 1),
      AnswerOption(label: 'Betydelig lammelse i nedre ansiktshavdel', score: 2),
      AnswerOption(label: 'Total lammelse i halve ansiktet\n(eller ved coma)', score: 3),
    ],
  ),
  NihssQuestion(
    id: '5a',
    title: 'Kraft i arm – venstre',
    description: 'Test hver arm for seg\nHold armen i 90° (sittende) eller 45° (liggende) i 10 sekunder.',
    guidance:
        'Test hver arm for seg. Hjelp pasienten til å holde armen utstrakt i 45° / 90° vinkel med håndflaten ned, slipp armen og skår bevegelsen.\n'
        'Ved brudd/amputasjon skåres 0.',
    illustrationAsset: 'assets/images/motorikk_arm.png',
    options: [
      AnswerOption(label: 'Normal  (også ved "ikke testbar")', score: 0),
      AnswerOption(label: 'Drifter til lavere posisjon', score: 1),
      AnswerOption(label: 'Noe bevegelse mot tyngdekraften,\ndrifter til sengen', score: 2),
      AnswerOption(label: 'Kun små muskelbevegelser,\nfaller til sengen', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '5b',
    title: 'Kraft i arm – høyre',
    description: 'Test hver arm for seg.\nHold armen i 90° (sittende) eller 45° (liggende) i 10 sekunder.',
    guidance:
        'Test hver arm for seg. Hjelp pasienten til å holde armen utstrakt i 45° / 90° vinkel med håndflaten ned, slipp armen og skår bevegelsen.\n'
        'Ved brudd/amputasjon skåres 0.',
    illustrationAsset: 'assets/images/motorikk_arm.png',
    options: [
      AnswerOption(label: 'Normal  (også ved "ikke testbar")', score: 0),
      AnswerOption(label: 'Drifter til lavere posisjon', score: 1),
      AnswerOption(label: 'Noe bevegelse mot tyngdekraften,\ndrifter til sengen', score: 2),
      AnswerOption(label: 'Kun små muskelbevegelser,\nfaller til sengen', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '6a',
    title: 'Kraft i ben – venstre',
    description: 'Test hvert ben for seg.\nHold benet utstrakt 30° i 5 sekunder.',
    guidance:
        'Test hvert ben for seg. Hjelp pasienten til å holde benet utstrakt i 30 ° vinkel, slipp benet og skår bevegelsen.\n'
        'Ved brudd/amputasjon skåres 0.',
    illustrationAsset: 'assets/images/motorikk_arm.png',
    options: [
      AnswerOption(label: 'Normal  (også ved "ikke testbar")', score: 0),
      AnswerOption(label: 'Drifter til lavere posisjon', score: 1),
      AnswerOption(label: 'Noe bevegelse mot tyngdekraften,\ndrifter til sengen', score: 2),
      AnswerOption(label: 'Ingen bevegelse mot tyngdekraften,\nfaller til sengen', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '6b',
    title: 'Kraft i ben – høyre',
    description: 'Test hvert ben for seg.\nHold benet utstrakt 30° i 5 sekunder.',
    guidance: 
        'Test hvert ben for seg. Hjelp pasienten til å holde benet utstrakt i 30 ° vinkel, slipp benet og skår bevegelsen.\n'
        'Ved brudd/amputasjon skåres 0.',
    illustrationAsset: 'assets/images/motorikk_arm.png',
    options: [
      AnswerOption(label: 'Normal  (også ved "ikke testbar")', score: 0),
      AnswerOption(label: 'Drifter til lavere posisjon', score: 1),
      AnswerOption(label: 'Noe bevegelse mot tyngdekraften,\ndrifter til sengen', score: 2),
      AnswerOption(label: 'Ingen bevegelse mot tyngdekraften,\nfaller til sengen', score: 3),
      AnswerOption(label: 'Ingen bevegelse', score: 4),
    ],
  ),
  NihssQuestion(
    id: '7a',
    title: 'Koordinasjon / Ataksi',
    description: 'Finger-nese-prøve / hæl-kne-prøve',
    guidance:
        'Test finger-til-nese og hæl-til-kne prøve på begge sider. Ataksi skal ikke skåres hvis den kan forklares av kraftsvikt eller sensorisk svikt alene. Det du ser etter er “klossete” bevegelser som ikke skyldes ren lammelse.\n'
        'Ved paralyse eller hos pasienter som ikke klarer å følge instruksjonen, skåres 0 = normal',
    illustrationAsset: 'assets/images/ataksi.png',
    options: [
      AnswerOption(label: 'Normal\n(også ved "ikke testbar" eller ved coma)', score: 0),
      AnswerOption(label: 'Ataksi i arm eller ben', score: 1),
      AnswerOption(label: 'Ataksi i arm og ben', score: 2),
    ],
  ),
  NihssQuestion(
    id: '8a',
    title: 'Hudfølelse',
    description: 'Sensibilitet for berøring eller stikk',
    guidance:
        'Test respons på lett berøring og/eller pinprick på begge sider av kroppen på overarmer, lår. Markert sensibilitetstap skåres kun når det er entydig til stede. Stuporøse og afatiske pasienter skåres vanligvis 0 eller 1.\n'
        'Pasienter med hjernestammeinfarkt og bilateralt sensibilitetstap, eller komatøse pasienter skåres 2.',
    illustrationAsset: 'assets/images/hudfølelse.png',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Lettere sensibilitetsnedsettelse', score: 1),
      AnswerOption(label: 'Markert sensibilitetstap\n(også ved coma, tertraparese)', score: 2),
    ],
  ),
  NihssQuestion(
    id: '9a',
    title: 'Språk / afasi',
    description: 'Spontan tale, taleforståelse',
    guidance:
        'Pasienten skal formelt skåres etter standardiserte bilder og (engelske) setninger. I praksis testes språket ved å vurdere spontan tale og taleforståelse. Leseforståelse testes ved å skrive med store bokstaver ”lukk øynene” på et papir og be pasienten gjøre hva som står på lappen.\n'
        'Benevning testes ved at pasienten sier navnet på forskjellige kjente gjenstander. Samlet språkvurdering går på om samtale er ”mulig” eller ”svært vanskelig eller umulig”. Komatøse pasienter skårer 3',
    illustrationAsset: 'assets/images/afasi.png',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Moderat afasi, samtale mulig', score: 1),
      AnswerOption(label: 'Markert afasi, samtale svært vanskelig eller umulig', score: 2),
      AnswerOption(label: 'Ikke språk (også ved coma)', score: 3),
    ],
  ),
  NihssQuestion(
    id: '10a',
    title: 'Tale / dysartri',
    description: 'Spontan tale',
    guidance:
        'Pasienten skal formelt skåres etter standardiserte bilder og (engelske) setninger. I praksis testes tale gjennom samtale med pasienten.\n'
        'Pasienter som ikke har språk, som ikke kan forstås på en meningsfylt måte, eller er komatøs, skårer 2. Alle andre lettere grader av dysartri skårer 1.',
    illustrationAsset: 'assets/images/dysartri.png',
    options: [
      AnswerOption(label: 'Normal', score: 0),
      AnswerOption(label: 'Mild - moderat dysartri', score: 1),
      AnswerOption(label: 'Nær uforståelig tale eller anartri\n(også ved coma)', score: 2),
    ],
  ),
  NihssQuestion(
    id: '11a',
    title: 'Neglekt / ekstinksjon',
    description: 'Bilateral simultan stimulering av syn og hudsensibilitet',
    guidance:
        'Utfør tester basert på 3 og 8.\nHvis pasienten har betydelig synstap (hemianopsi) og sensibiliteten er normal, skåres 0 = normal.\n'
        'Hvis pasienten er afatisk, men har oppmerksomhet mot begge sider, skåres 0 = normal.\n'
        'Pasienter som entydig neglisjerer halvdelen av rommet (selv om de ikke har ekstinksjon ved visuell/ sensorisk testing) skåres 1\nKomatøse pasienter skåres 2.\n\n'
        'Ekstinksjon = kun under dobbelt stimulering.\nNeglekt = pasienten overser halve rommet/kroppen hele tiden.\nTydelig neglekt skal alltid gi poeng, selv om ekstinksjonstesten virker normal.',
    options: [
      AnswerOption(label: 'Normal (også ved hemianopsi med normal sensibilitet)', score: 0),
      AnswerOption(label: 'Neglect i en sansemodalitet', score: 1),
      AnswerOption(label: 'Neglect i begge sansemodaliteter', score: 2),
    ],
  ),
];

