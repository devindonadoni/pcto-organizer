import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testfinale/pages/home_page_studente.dart';
import 'package:testfinale/pages/home_page_studente_start.dart';
import 'package:testfinale/pages/login2_page.dart';
import 'business/data_handler.dart';
import 'business/main_controller.dart';
import 'constants.dart';
import 'pages/home_page_professore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: BackgroundColor,
      systemNavigationBarColor: BackgroundColor,
    ),
  );
  loadLoginState();
  loadCompletionState();// controlla se l'utente e' loggato
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 10), (Timer t) => checkLoginState(context));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'APP PCTO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'inter'),
      home:Login2Page(),
      //home: HomePageStudenteStart(),
    );
  }
}
