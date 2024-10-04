import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../beans/ProgettoFormativo.dart';
import '../../widgets/progettoFormativo_studente.dart';
import '../data_handler.dart';

class ProgettiFormativiHandler {
  ProgettiFormativiHandler._privateConstructor();

  static final ProgettiFormativiHandler _instance = ProgettiFormativiHandler._privateConstructor();

  factory ProgettiFormativiHandler() {
    return _instance;
  }

  List<ProgettoFormativo> progettiFormativi = [];

  Future<List<ProgettoFormativo>> getProgettiFormativi(bool forceRequest) async {
    if (progettiFormativi.isNotEmpty && !forceRequest) return progettiFormativi;

    var api = "cruscotto/progettiformativi";
    var url = Uri.parse(baseUrl + api);

    print("Connecting to server to fetch Progetti Formativi..");

    try {
      var risposta = await http.get(url, headers: headers_getAll);

      if (risposta.statusCode == 200) {
        var jsonData = jsonDecode(risposta.body);

        if (jsonData is List) {
          progettiFormativi.clear();
          for (var eachProgetto in jsonData) {
            try {
              final progetto = ProgettoFormativo.fromMap(eachProgetto);
              print(progetto);
              progettiFormativi.add(progetto);
            } catch (e, stacktrace) {
              print('Error parsing progetto formativo: $e');
              print('Progetto formativo data: $eachProgetto');
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

    print("Fetch Progetti Formativi - Done!");

    return progettiFormativi;
  }

}
