import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/business/data_handler.dart';
import 'package:testfinale/business/main_controller.dart';
import 'package:testfinale/widgets/privacy_widget.dart';
import '../../business/handlers_wrapper.dart';
import '../../constants.dart';
import '../login2_page.dart';

class GeneralSettingsPage extends StatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  State<GeneralSettingsPage> createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: BackgroundColor),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: SvgPicture.asset(
                      'assets/Icons/Settings.svg',
                      width: 40.0,
                      height: 80.0,
                      colorFilter:
                          ColorFilter.mode(TextColor_OnDark, BlendMode.srcIn),
                    ),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      child: Icon(
                        Icons.arrow_back,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  top: 0,
                  left: 0,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: SecondaryColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 25),
                              child: Text(
                                "Impostazioni",
                                style: TextStyle(
                                    color: TextColor_OnLight,
                                    decoration: TextDecoration.none,
                                    fontSize: 40,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            Visibility(child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Il tuo account",
                                    style: TextStyle(
                                        color: HexColor('#7D7D7D'),
                                        decoration: TextDecoration.none,
                                        fontFamily: "inter",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(left: 20, bottom: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/icons/User.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Gestione account",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                  TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),visible: isTutor,),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Utilizzo",
                                    style: TextStyle(
                                        color: HexColor('#7D7D7D'),
                                        decoration: TextDecoration.none,
                                        fontFamily: "inter",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //COTAINER ROW
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/icons_old/Bell.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Notifiche",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //COTAINER ROW
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/Icons/Sun.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Tema",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //COTAINER ROW
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/Icons/Book_Bookmark.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Archivio",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Assistenza & privacy",
                                    style: TextStyle(
                                        color: HexColor('#7D7D7D'),
                                        decoration: TextDecoration.none,
                                        fontFamily: "inter",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //COTAINER ROW
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/Icons/Help.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Aiuto",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //COTAINER ROW
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/Icons/Library.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Termini e condizioni",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 10, top: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/Icons/Lock.svg',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  colorFilter: ColorFilter.mode(
                                                      TextColor_OnLight,
                                                      BlendMode.srcIn),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AutoSizeText(
                                                maxLines: 2,
                                                "Privacy",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  color: TextColor_OnLight,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  //qui
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: SvgPicture.asset(
                                                'assets/icons_old/arrow_right.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                colorFilter: ColorFilter.mode(
                                                    TextColor_OnLight,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //ACCESSO
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Accesso",
                                    style: TextStyle(
                                        color: HexColor('#7D7D7D'),
                                        decoration: TextDecoration.none,
                                        fontFamily: "inter",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() async {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) =>
                                        const Login2Page()),
                                        );
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                //COTAINER ROW
                                                Container(
                                                  child: SvgPicture.asset(
                                                    'assets/Icons/Logout_3__broken.svg',
                                                    width: 30.0,
                                                    height: 30.0,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            HexColor("#971B1B"),
                                                            BlendMode.srcIn),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                AutoSizeText(
                                                  maxLines: 2,
                                                 "ESCI",
                                                  style: TextStyle(
                                                    fontFamily: "inter",
                                                    color: HexColor("#971B1B"),
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    //qui
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Policy(),
            )
          ],
        ),
      ),
    );
  }
}
