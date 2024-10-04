import 'dart:convert';
import '../../beans/Azienda.dart';
import '../data_handler.dart';

class AziendeHandler {
  List<Azienda> aziende = [];

  AziendeHandler._privateConstructor();

  static final AziendeHandler _instance = AziendeHandler._privateConstructor();

  factory AziendeHandler() {
    return _instance;
  }

  Future<List<Azienda>> getAziende(bool force_request) async {
    if (aziende.isNotEmpty && !force_request) return aziende;

    var api = "cruscotto/aziende";
    var url = Uri.parse(baseUrl + api);

    print("Connecting to server to fetch Aziende..");

    try {
      var risposta = await client.get(url, headers: headers_getAll);

      if (risposta.statusCode == 200) {
        var jsonData = jsonDecode(risposta.body);

        print(jsonData);

        if (jsonData is List) {
          aziende.clear();
          for (var eachAzienda in jsonData) {
            try {
              final azienda = Azienda(
                id: eachAzienda['id'] is int
                    ? eachAzienda['id']
                    : int.parse(eachAzienda['id']),
                pIVA: eachAzienda['pIVA'] as String,
                sedeLegale: eachAzienda['sedeLegale'] as String,
                topic: eachAzienda['topic'] as String,
                note: eachAzienda['note'] as String,
                statoConvenzione: eachAzienda['statoConvenzione'] as String,
                nConvenzione: eachAzienda['nConvenzione'] as String,
                ragioneSociale: eachAzienda['ragioneSociale'] as String,
                DVR: eachAzienda['idDvr'] is int
                    ? eachAzienda['idDvr']
                    : int.parse(eachAzienda['idDvr']),
              );
              aziende.add(azienda);
            } catch (e, stacktrace) {
              print('Error parsing azienda: $e');
              print('Azienda data: $eachAzienda');
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

    print("Fetch Aziende - Done!");

    return aziende;
  }

  Future<bool> addAzienda(Azienda aziendaToAdd) async {
    var api = "cruscotto/azienda";
    var ragioneSociale = aziendaToAdd.ragioneSociale;
    var pIVA = aziendaToAdd.pIVA;
    var sedeLegale = aziendaToAdd.sedeLegale;
    var topic = aziendaToAdd.topic;
    var note = aziendaToAdd.note;
    var statoConvenzione = aziendaToAdd.statoConvenzione;
    var nConvenzione = aziendaToAdd.nConvenzione;

    var url = Uri.parse("$baseUrl/$api/$ragioneSociale/$pIVA/$sedeLegale/$topic/$note/$statoConvenzione/$nConvenzione");

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