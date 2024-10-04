class Azienda {
  int id;
  String ragioneSociale;
  String pIVA;
  String sedeLegale;
  String topic;
  String note;
  String statoConvenzione;
  String nConvenzione;
  int DVR;

  Azienda({
    required this.id,
    required this.ragioneSociale,
    required this.pIVA,
    required this.sedeLegale,
    required this.topic,
    required this.note,
    required this.statoConvenzione,
    required this.nConvenzione,
    required this.DVR,
  });

  factory Azienda.fromMap(Map<String, dynamic> map) {
    return Azienda(
      id: map['id'] as int,
      ragioneSociale: map['ragioneSociale'],
      pIVA: map['pIVA'],
      sedeLegale: map['sedeLegale'],
      topic: map['topic'],
      note: map['note'],
      statoConvenzione: map['statoConvenzione'],
      nConvenzione: map['nConvenzione'],
      DVR: map['DVR'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ragioneSociale': ragioneSociale,
      'pIVA': pIVA,
      'sedeLegale': sedeLegale,
      'topic': topic,
      'note': note,
      'statoConvenzione': statoConvenzione,
      'nConvenzione': nConvenzione,
      'DVR': DVR,
    };
  }
  factory Azienda.fromJson(Map<String, dynamic> json) {
    return Azienda(
      id: json['id'] as int,
      ragioneSociale: json['ragioneSociale'] as String,
      pIVA: json['pIVA'] as String,
      sedeLegale: json['sedeLegale'] as String,
      topic: json['topic'] as String,
      note: json['note'] as String,
      statoConvenzione: json['statoConvenzione'] as String,
      nConvenzione: json['nConvenzione'] as String,
      DVR: json['idDvr'] is int ? json['idDvr'] : int.tryParse(json['idDvr']) ?? 0,
    );
  }

  set setId(int id) => this.id = id;

  String get getRagioneSociale => ragioneSociale;
  set setRagioneSociale(String ragioneSociale) => this.ragioneSociale = ragioneSociale;

  String get getPIVA => pIVA;
  set setPIVA(String pIVA) => this.pIVA = pIVA;

  String get getSedeLegale => sedeLegale;
  set setSedeLegale(String sedeLegale) => this.sedeLegale = sedeLegale;

  String get getTopic => topic;
  set setTopic(String topic) => this.topic = topic;

  String get getNote => note;
  set setNote(String note) => this.note = note;

  String get getStatoConvenzione => statoConvenzione;
  set setStatoConvenzione(String statoConvenzione) => this.statoConvenzione = statoConvenzione;

  String get getNConvenzione => nConvenzione;
  set setNConvenzione(String nConvenzione) => this.nConvenzione = nConvenzione;

  int get getDVR => DVR;
  set setDVR(int DVR) => this.DVR = DVR;
}
