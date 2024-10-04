import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:testfinale/beans/PCTO.dart';
import 'package:testfinale/beans/ProgettoFormativo.dart';
import 'package:testfinale/beans/Studente.dart';
import 'package:testfinale/beans/TutorScolastico.dart';
import '../beans/Azienda.dart';
import '../beans/User.dart';
import 'main_controller.dart';

List<ProgettoFormativo> progettiFormativi = [];
List<PCTO> allPcto = [];
List<TutorScolastico> tutorScolastici = [];

bool isTutor = false;

late User utenteCorrente;

const String baseUrl = "http://192.168.8.103/";
final Client client = http.Client();
const Map<String, String> headers_getAll = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

void saveLoginState(bool loginState) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("logged", loginState);
  print("saved");
  print(loginState);
}

void saveCompletionState(bool completed) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("completed", completed);
}

void loadLoginState() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  logged = prefs.getBool('logged') ?? false;
}
void loadCompletionState() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  profileComlpeted = prefs.getBool('completed') ?? false;
}