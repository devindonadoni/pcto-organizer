class ProgettoFormativo {
  int id;
  String descrizioneAttivita;
  DateTime? dataProgetto; // Made nullable
  int idTutorScolastico;
  int idTutorAziendale1; // Updated field name
  int? idTutorAziendale2; // Made nullable
  int idStudente;
  int idPctoXAzienda;
  int idSedeTirocinio;

  ProgettoFormativo({
    required this.id,
    required this.descrizioneAttivita,
    this.dataProgetto,
    required this.idTutorScolastico,
    required this.idTutorAziendale1,
    this.idTutorAziendale2,
    required this.idStudente,
    required this.idPctoXAzienda,
    required this.idSedeTirocinio,
  });

  factory ProgettoFormativo.fromMap(Map<String, dynamic> map) {
    return ProgettoFormativo(
      id: map['id'] as int,
      descrizioneAttivita: map['descrizioneAttivita'] as String? ?? '',
      dataProgetto: map['dataProgetto'] != null ? DateTime.parse(map['dataProgetto']) : null,
      idTutorScolastico: map['idTutorScolastico'] as int,
      idTutorAziendale1: map['idTutorAziendale1'] as int,
      idTutorAziendale2: map['idTutorAziendale2'] != null ? map['idTutorAziendale2'] as int : null,
      idStudente: map['idStudente'] as int,
      idPctoXAzienda: map['idPctoXAzienda'] as int,
      idSedeTirocinio: map['idSedeTirocinio'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descrizioneAttivita': descrizioneAttivita,
      'dataProgetto': dataProgetto?.toIso8601String(),
      'idTutorScolastico': idTutorScolastico,
      'idTutorAziendale1': idTutorAziendale1,
      'idTutorAziendale2': idTutorAziendale2,
      'idStudente': idStudente,
      'idPctoXAzienda': idPctoXAzienda,
      'idSedeTirocinio': idSedeTirocinio,
    };
  }

  @override
  String toString() {
    return 'ProgettoFormativo{id: $id, descrizioneAttivita: $descrizioneAttivita, dataProgetto: $dataProgetto, idTutorScolastico: $idTutorScolastico, idTutorAziendale1: $idTutorAziendale1, idTutorAziendale2: $idTutorAziendale2, idStudente: $idStudente, idPctoXAzienda: $idPctoXAzienda, idSedeTirocinio: $idSedeTirocinio}';
  }
}
