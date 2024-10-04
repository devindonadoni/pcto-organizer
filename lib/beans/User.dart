class User {
  int id;
  String nome;
  String cognome;
  String username;
  String password;
  bool isProfessore;

  User({
    required this.id,
    required this.nome,
    required this.cognome,
    required this.username,
    required this.password,
    required this.isProfessore
  });
  bool get getIsProfessore => isProfessore;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getNome => nome;

  set setNome(String nome) => this.nome = nome;

  String get getCognome => cognome;

  set setCognome(String cognome) => this.cognome = cognome;

  String get getUsername => username;

  set setUsername(String username) => this.username = username;

  String get getPassword => password;

  set setPassword(String password) => this.password = password;

  @override
  String toString() {
    return 'Login{id: $id, nome: $nome, cognome: $cognome, username: $username, password: $password}';
  }
  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      nome: map['nome'] as String,
      cognome: map['cognome'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      isProfessore: map['isProfessore'] as bool
    );
  }

  // toMap function
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cognome': cognome,
      'username': username,
      'password': password,
      'isProfessore' : isProfessore
    };
  }
}
