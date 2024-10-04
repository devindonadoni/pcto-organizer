

import 'dart:convert';

import 'package:intl/intl.dart';

import '../../beans/Studente.dart';
import '../data_handler.dart';

class StudentiHandler {

  List<Studente> studenti = [];

  StudentiHandler._privateConstructor();

  static final StudentiHandler _instance = StudentiHandler._privateConstructor();

  factory StudentiHandler() {
    return _instance;
  }

  Future<List<Studente>> getStudenti(bool force_request) async {
    List<Studente> studenti = [];

    if (studenti.isNotEmpty && !force_request) return studenti;

    var api = "cruscotto/studenti";
    var url = Uri.parse(baseUrl + api);

    print("Connecting to server to fetch Studenti..");

    try {
      var risposta = await client.get(url, headers: headers_getAll);

      if (risposta.statusCode == 200) {
        var jsonData = jsonDecode(risposta.body);

        if (jsonData is List) {
          studenti.clear();
          for (var eachStudente in jsonData) {
            try {
              final studente = Studente(
                id: eachStudente['id'] is int
                    ? eachStudente['id']
                    : int.parse(eachStudente['id']),
                nome: eachStudente['nome'] as String,
                cognome: eachStudente['cognome'] as String,
                classe: eachStudente['classe'] as String,
                comuneNascita: (eachStudente['comuneNascita'] as String).isEmpty
                    ? "Non dichiarato"
                    : eachStudente['comuneNascita'] as String,
                dataNascita: (eachStudente['dataNascita'] as String).isEmpty
                    ? DateTime(1000, 10, 10)
                    : DateTime.parse(eachStudente['dataNascita']),
                comuneResidenza: eachStudente['comuneResidenza'] as String,
                indirizzoResidenza: eachStudente['indirizzoResidenza'] as String,
                pei: eachStudente['pei'] as String,
                idPcto: eachStudente['idPcto'] is int
                    ? eachStudente['idPcto']
                    : int.parse(eachStudente['idPcto']),
              );
              studenti.add(studente);
            } catch (e, stacktrace) {
              print('Error parsing studente: $e');
              print('Studente data: $eachStudente');
              print('Stack trace: $stacktrace');
            }
          }
        }
      } else {
        print('Failed: ${risposta.statusCode}');
        print('Response body: ${risposta.body}');
      }
    } catch (e, stacktrace) {
      print('Error: $e');
      print('Stack trace: $stacktrace');
    }

    print("Fetch Studenti - Done!");

    return studenti;
  }

  Future<bool> addStudente(Studente studenteToAdd) async {
    var api = "cruscotto/studente";
    var name = studenteToAdd.nome;
    var surname = studenteToAdd.cognome;
    var classe = studenteToAdd.classe;
    var comuneNascita = studenteToAdd.comuneNascita;
    var dataNascita = DateFormat("yyyy-mm-dd").format(studenteToAdd.dataNascita);
    var comuneResidenza = studenteToAdd.comuneResidenza;
    var indirizzoResidenza = studenteToAdd.indirizzoResidenza;
    var pei = studenteToAdd.pei;
    var idPcto = studenteToAdd.idPcto;

    var url = Uri.parse("$baseUrl/$api/$name/$surname/$classe/$comuneNascita/$dataNascita/$comuneResidenza/$indirizzoResidenza/$pei/$idPcto");

    try {
      var risposta = await client.post(url, headers: headers_getAll);

      if (risposta.statusCode == 200) {
        return true;
      } else {
        print('Failed: ${risposta.statusCode}');
        print('Response body: ${risposta.body}');
        return false;
      }
    } catch (e, stacktrace) {
      print('Error: $e');
      print('Stack trace: $stacktrace');
      return false;
    }
  }
}