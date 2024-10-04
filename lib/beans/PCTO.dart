class PCTO {
  int id;
  String annoScolastico;
  String classi;
  String corrente;

  PCTO({
    required this.id,
    required this.annoScolastico,
    required this.classi,
    required this.corrente,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getAnnoScolastico => annoScolastico;

  set setAnnoScolastico(String annoScolastico) => this.annoScolastico = annoScolastico;

  String get getClassi => classi;

  set setClassi(String classi) => this.classi = classi;

  String get getCorrente => corrente;

  @override
  String toString() {
    return 'PCTO{id: $id, annoScolastico: $annoScolastico, classi: $classi, corrente: $corrente}';
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'annoScolastico': annoScolastico,
      'classi': classi,
      'corrente': corrente,
    };
  }
  factory PCTO.fromMap(Map<String, dynamic> map) {
    return PCTO(
      id: map['id'] as int,
      annoScolastico: map['annoScolastico'] as String,
      classi: map['classi'] as String,
      corrente: map['corrente'] as String,
    );
  }
}
