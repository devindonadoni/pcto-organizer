class TutorScolastico {
  int id;
  String classe;
  String docente;
  String descrizione;
  int idPcto;

  TutorScolastico({
    required this.id,
    required this.classe,
    required this.docente,
    required this.descrizione,
    required this.idPcto,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getClasse => classe;

  set setClasse(String classe) => this.classe = classe;

  String get getDocente => docente;

  set setDocente(String docente) => this.docente = docente;

  String get getDescrizione => descrizione;

  set setDescrizione(String descrizione) => this.descrizione = descrizione;

  int get getIdPcto => idPcto;

  set setIdPcto(int idPcto) => this.idPcto = idPcto;

  @override
  String toString() {
    return 'TutorScolastico{id: $id, classe: $classe, docente: $docente, descrizione: $descrizione, idPcto: $idPcto}';
  }
  factory TutorScolastico.fromMap(Map<String, dynamic> map) {
    return TutorScolastico(
      id: map['id'] as int,
      classe: map['classe'] as String,
      docente: map['docente'] as String,
      descrizione: map['descrizione'] as String,
      idPcto: map['idPcto'] as int,
    );
  }

  // toMap function
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'classe': classe,
      'docente': docente,
      'descrizione': descrizione,
      'idPcto': idPcto,
    };
  }
}
