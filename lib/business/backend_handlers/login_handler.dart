import 'dart:convert';

import '../../beans/Studente.dart';
import '../../beans/TutorScolastico.dart';
import '../data_handler.dart';

class LoginHandler {
  late Studente loggedStudent;
  late TutorScolastico loggedTutor;

  // Singleton
  LoginHandler._privateConstructor();

  static final LoginHandler _instance = LoginHandler._privateConstructor();

  factory LoginHandler() => _instance;

  Future<dynamic> login(Map<String, String> data_request) async {
    var api_studente = "cruscotto/login";
    var username = data_request['username'];
    var password = data_request['password'];
    var url = Uri.parse("$baseUrl$api_studente/$username/$password");

    try {
      var risposta = await client.post(url, headers: headers_getAll);

      if (risposta.statusCode == 200) {
        var jsonData = jsonDecode(risposta.body);
        if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('nome') && jsonData.containsKey('cognome')) {
            try {
              loggedStudent = Studente.fromMap(jsonData);
              return loggedStudent;
            } catch (e, stacktrace) {
              print('Error parsing student login data: $e');
              print('Student login data: $jsonData');
              print('Stack trace: $stacktrace');
            }
          } else if (jsonData.containsKey('docente')) {
            try {
              loggedTutor = TutorScolastico.fromMap(jsonData);
              isTutor = true;
              return loggedTutor;
            } catch (e, stacktrace) {
              print('Error parsing teacher login data: $e');
              print('Teacher login data: $jsonData');
              print('Stack trace: $stacktrace');
            }
          } else {
            print('Unknown login type');
          }
        }
      } else {
        print('Login failed: ${risposta.statusCode}');
        print('Response body: ${risposta.body}');
      }
    } catch (e, stacktrace) {
      print('Error: $e');
      print('Stack trace: $stacktrace');
    }
    return null;
  }

  Future logout() async {
    var api_studente = "cruscotto/logout";
    var url = Uri.parse("$baseUrl$api_studente");
    try {
      var risposta = await client.post(url, headers: headers_getAll);

      if (risposta.statusCode == 200) {
        var jsonData = jsonDecode(risposta.body);
        if (jsonData is Map<String, dynamic>) {
          if (jsonData['session'] == "Destroyed successfully") {
            print('Session destroyed nigga');
            return true;
          }
        }
      }
    } catch(e, stacktrace) {
      print(e);
      print(stacktrace);
    }
    return false;
  }
}
