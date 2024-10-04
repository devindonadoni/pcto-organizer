// questa pagina deve essere presa e riutilizzata per poterne creare delle altre sempre con lo stesso "stampo"
// non modificate direttamente questo file, fate copia ed incolla in uno nuovo del codice
// cambiate il nome della classe con il nome della pagina che state facendo in quel momento
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfinale/constants.dart';
import 'package:testfinale/pages/profile_setting.dart';
import 'package:testfinale/widgets/center_container.dart';
import 'dart:io';
import '../business/http_helper.dart';
import '../widgets/privacy_widget.dart';

class Modelpage extends StatefulWidget {
  const Modelpage({super.key});

  @override
  State<Modelpage> createState() => ModelpageState();
}

class ModelpageState extends State<Modelpage> {
  late Timer _timer;
  bool mostraLogoCentrale = false;
  bool showTopMenu = false;

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
                    absorbing: !showTopMenu,
                  ),
                  Expanded(
                    child: CenterContainer(

                        // qui si mette il child che si vuole visualizzare al centro della schermata che si sta sviluppando
                        // non ci si deve preoccupare se il tutto è troppo esteso in lunghezza

                        ),
                  ),
                  Padding(
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
