import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfinale/home_sections/section_pf.dart';
import 'package:testfinale/home_sections/section_studenti.dart';
import 'package:testfinale/pages/profile_setting.dart';
import 'package:testfinale/widgets/complete_profile.dart';
import 'package:testfinale/widgets/custom_menu.dart';

import '../business/http_helper.dart';
import '../business/main_controller.dart';
import '../constants.dart';
import '../home_sections/section_aziende.dart';
import '../widgets/center_container.dart';
import '../widgets/privacy_widget.dart';

class HomePageStudenteStart extends StatefulWidget {
  const HomePageStudenteStart({super.key});

  @override
  State<HomePageStudenteStart> createState() => _HomePageStudenteStartState();
}

class _HomePageStudenteStartState extends State<HomePageStudenteStart> {
  late Timer _timer;
  bool isConnected = false;
  bool isCheckingConnection = true;
  bool mostraLogoCentrale = false;
  bool showTopMenu = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer t) => checkConnectivity());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    absorbing: !showTopMenu,
                    child: Opacity(
                      opacity: showTopMenu ? 1 : 0,
                      child: Container(
                        margin: EdgeInsets.all(20),
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
                  ),
                  Expanded(
                    child: CenterContainer(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Text(
                                    "Qualche dato nel tuo profilo e' mancante, completalo!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "inter",
                                        color: ElementsColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 35),
                              Container(
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AccentColor,
                                      foregroundColor: Colors.white,
                                      shadowColor: Colors.blueAccent,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 16),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CompleteProfilePage()));
                                      });
                                    },
                                    child: const Text(
                                      'COMPLETA SUBITO',
                                      style: TextStyle(fontSize: 18,fontFamily: "inter"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
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
    );
  }
}
