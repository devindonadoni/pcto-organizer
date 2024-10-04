class Studente {
  int id;
  String nome;
  String cognome;
  String classe;
  String comuneNascita;
  DateTime dataNascita;
  String comuneResidenza;
  String indirizzoResidenza;
  String pei;
  int idPcto;

  Studente({
    required this.id,
    required this.nome,
    required this.cognome,
    required this.classe,
    required this.comuneNascita,
    required this.dataNascita,
    required this.comuneResidenza,
    required this.indirizzoResidenza,
    required this.pei,
    required this.idPcto,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getNome => nome;

  set setNome(String nome) => this.nome = nome;

  String get getCognome => cognome;

  set setCognome(String cognome) => this.cognome = cognome;

  String get getClasse => classe;

  set setClasse(String classe) => this.classe = classe;

  String get getComuneNascita => comuneNascita;

  set setComuneNascita(String comuneNascita) => this.comuneNascita = comuneNascita;

  DateTime get getDataNascita => dataNascita;

  set setDataNascita(DateTime dataNascita) => this.dataNascita = dataNascita;

  String get getComuneResidenza => comuneResidenza;

  set setComuneResidenza(String comuneResidenza) =>
      this.comuneResidenza = comuneResidenza;

  String get getIndirizzoResidenza => indirizzoResidenza;

  set setIndirizzoResidenza(String indirizzoResidenza) =>
      this.indirizzoResidenza = indirizzoResidenza;

  String get getPei => pei;

  set setPei(String pei) => this.pei = pei;

  int get getIdPcto => idPcto;

  set setIdPcto(int idPcto) => this.idPcto = idPcto;

  @override
  String toString() {
    return 'Studente{id: $id, nome: $nome, cognome: $cognome, classe: $classe, comuneNascita: $comuneNascita, dataNascita: $dataNascita, comuneResidenza: $comuneResidenza, indirizzoResidenza: $indirizzoResidenza, pei: $pei, idPcto: $idPcto}';
  }

  bool isMaggiorenne() {
    final now = DateTime.now();
    final age = now.year - dataNascita.year;
    if (now.month < dataNascita.month || (now.month == dataNascita.month && now.day < dataNascita.day)) {
      return age > 18;
    }
    return age >= 18;
  }

  factory Studente.fromMap(Map<String, dynamic> map) {
    return Studente(
      id: map['id'] as int,
      nome: map['nome'] as String,
      cognome: map['cognome'] as String,
      classe: map['classe'] as String,
      comuneNascita: map['comuneNascita'] as String,
      dataNascita: DateTime.parse(map['dataNascita'] as String),
      comuneResidenza: map['comuneResidenza'] as String,
      indirizzoResidenza: map['indirizzoResidenza'] as String,
      pei: map['pei'] as String,
      idPcto: map['idPcto'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cognome': cognome,
      'classe': classe,
      'comuneNascita': comuneNascita,
      'dataNascita': dataNascita.toIso8601String(),
      'comuneResidenza': comuneResidenza,
      'indirizzoResidenza': indirizzoResidenza,
      'pei': pei,
      'idPcto': idPcto,
    };
  }
}
