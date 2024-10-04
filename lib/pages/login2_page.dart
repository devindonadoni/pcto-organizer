import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/constants.dart';
import 'package:testfinale/pages/home_page_studente.dart';
import 'package:testfinale/pages/profile_setting.dart';
import 'package:testfinale/widgets/center_container.dart';
import '../beans/Studente.dart';
import '../beans/TutorScolastico.dart';
import '../business/data_handler.dart';
import '../business/handlers_wrapper.dart';
import '../business/http_helper.dart';
import '../business/main_controller.dart';
import '../widgets/custom_checkBox.dart';
import '../widgets/privacy_widget.dart';
import 'home_page_professore.dart';
import 'home_page_studente_start.dart';

class Login2Page extends StatefulWidget {
  const Login2Page({super.key});

  @override
  State<Login2Page> createState() => Login2PageState();
}

class Login2PageState extends State<Login2Page> {
  late Timer _timer;
  bool mostraLogoCentrale = true;
  bool showTopMenu = false;
  bool _obscureText = true;
  bool validLogin = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool saveMyLogin = true;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    _timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => checkConnectivity());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleLogin() async {
    Map<String, String> data_request = {
      'username': usernameController.text,
      'password': passwordController.text
    };

    dynamic loginResult = await loginHandler.login(data_request);

    if (loginResult == null) {
      setState(() {
        validLogin = false;
      });
      return;
    }

    if (saveMyLogin) {
      saveLoginState(true);
    }

    if (loginResult is TutorScolastico) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage_Professore()),
      );
    } else if (loginResult is Studente) {


      if(profileComlpeted){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePageStudente()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePageStudenteStart()),
        );
      }

    }
    setState(() {
      validLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: BackgroundColor,
          child: SafeArea(
            child: Container(
              color: BackgroundColor,
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AbsorbPointer(
                        child: Opacity(
                          opacity: showTopMenu ? 1 : 0,
                          child: Container(
                            margin: EdgeInsets.all(60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/Menu_Dots.svg',
                                    width: 40.0,
                                    height: 40.0,
                                    colorFilter: ColorFilter.mode(
                                        TextColor_OnDark, BlendMode.srcIn),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      child: SvgPicture.asset(
                                        'assets/icons/User.svg',
                                        width: 40.0,
                                        height: 40.0,
                                        colorFilter: ColorFilter.mode(
                                            TextColor_OnDark, BlendMode.srcIn),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileSettings()));
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        absorbing: !showTopMenu,
                      ),
                      Expanded(
                        child: CenterContainer(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight: 60, // Altezza minima
                                  ),
                                  width: 190,
                                  margin: EdgeInsets.only(
                                      top: 70, right: 30, left: 30),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "EFFETTUA IL LOGIN",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AccentColor,
                                          decoration: TextDecoration.none,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "inter"),
                                    ),
                                  ),
                                ),

                                if (!validLogin)
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'Username o Password errati',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),

                                //TEXTFIELD
                                SizedBox(height: 30),

                                //username
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 40, left: 40, bottom: 20),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                )
                                              ],
                                            ),
                                            child: TextField(
                                              controller: usernameController,
                                              // Use the controller
                                              enabled: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide(
                                                      color:
                                                          HexColor("#053259"),
                                                      width: 3.0),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide(
                                                      color:
                                                          HexColor("#053259"),
                                                      width: 3.0),
                                                ),
                                                hintText: "Username",
                                                hintStyle: TextStyle(
                                                  color: HexColor("#898989"),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                      color:
                                                          HexColor("#AFAFAF")),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      13.0),
                                                  child: SvgPicture.asset(
                                                    'assets/icons_old/User.svg',
                                                    width: 10.0,
                                                    height: 10.0,
                                                    color: HexColor("#053259"),
                                                  ),
                                                ),
                                              ),
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: HexColor("#878787"),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //password
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 40, left: 40, bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                ),
                                              ],
                                            ),
                                            child: TextField(
                                              controller: passwordController,
                                              obscureText: _obscureText,
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide(
                                                    color: HexColor("#053259"),
                                                    width: 3.0,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide(
                                                    color: HexColor("#053259"),
                                                    width: 3.0,
                                                  ),
                                                ),
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                  color: HexColor("#898989"),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                    color: HexColor("#AFAFAF"),
                                                  ),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      13.0),
                                                  child: SvgPicture.asset(
                                                    'assets/Icons/Lock.svg',
                                                    width: 10.0,
                                                    height: 10.0,
                                                    color: HexColor("#053259"),
                                                  ),
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      13.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _obscureText =
                                                            !_obscureText; // Toggle state
                                                      });
                                                    },
                                                    child: SvgPicture.asset(
                                                      _obscureText
                                                          ? 'assets/icons_old/Eye_Closed2.svg'
                                                          : 'assets/icons_old/Eye2.svg',
                                                      width: 24.0,
                                                      height: 24.0,
                                                      color:
                                                          HexColor("#053259"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: HexColor("#878787"),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              //REMIND ME
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20, left: 40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: CheckBox(),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            child: Text(
                                              "Ricordami",
                                              style: TextStyle(
                                                  color: AccentColor,
                                                  fontSize: 20,
                                                  fontFamily: "inter",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    handleLogin();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 40, right: 40, top: 10),
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AccentColor,
                                      borderRadius: borderRadius,
                                      border: Border.all(
                                        color: HexColor("#A55527"),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: "inter",
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 45, top: 5),
                                    child: Container(
                                      child: Text(
                                        "Hai dimenticato la password?",
                                        style: TextStyle(
                                            color: AccentColor,
                                            fontFamily: "inter",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Policy(),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: mostraLogoCentrale,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 250.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/img/logo.png"),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
