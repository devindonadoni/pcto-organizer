import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/beans/ProgettoFormativo.dart';
import 'dart:math' as math;
import '../../constants.dart';

class ListElementProgettoFormativo extends StatefulWidget {
  final ProgettoFormativo progettoFormativo;

  const ListElementProgettoFormativo({super.key, required this.progettoFormativo});

  @override
  State<ListElementProgettoFormativo> createState() => ListElementProgettoFormativoState();
}

class ListElementProgettoFormativoState extends State<ListElementProgettoFormativo> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    String stato = "";
    bool filtroStato = false;
    Color stateColorBack = HexColor("#C7C7C7");
    Color stateColorBorder = HexColor("#C7C7C7");
    Color stateColorText = HexColor("#C7C7C7");

    return GestureDetector(
      onTap: () {
        setState(() {
          visible = !visible;
        });
      },
      child: Visibility(
        visible: true,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10, left: 5, right: 5),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                color: ElementsColor_Light,
                borderRadius: borderRadius,
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5, right: 30),
                    child: AutoSizeText(
                      widget.progettoFormativo.descrizioneAttivita,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          fontSize: 100,
                          decoration: TextDecoration.none,
                          color: TextColor_OnLight),
                      maxLines: 1,
                      maxFontSize: 32,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: AutoSizeText(
                      "Data progetto: ${widget.progettoFormativo.dataProgetto != null ? widget.progettoFormativo.dataProgetto!.toLocal().toString().split(' ')[0] : "Non disponibile"}",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 100,
                          decoration: TextDecoration.none,
                          color: TextColor_OnLight),
                      maxLines: 1,
                      maxFontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: AutoSizeText(
                      "Tutor scolastico: ${widget.progettoFormativo.idTutorScolastico}",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 100,
                          decoration: TextDecoration.none,
                          color: TextColor_OnLight),
                      maxLines: 1,
                      maxFontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: AutoSizeText(
                      "Tutor aziendale: ${widget.progettoFormativo.idTutorAziendale1}",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 100,
                          decoration: TextDecoration.none,
                          color: TextColor_OnLight),
                      maxLines: 1,
                      maxFontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: AutoSizeText(
                      "Studente: ${widget.progettoFormativo.idStudente}",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                          fontSize: 100,
                          decoration: TextDecoration.none,
                          color: TextColor_OnLight),
                      maxLines: 1,
                      maxFontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (visible) ...[
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: AutoSizeText(
                        "Descrizione pcto: ${widget.progettoFormativo.descrizioneAttivita}",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 100,
                            decoration: TextDecoration.none,
                            color: TextColor_OnLight),
                        maxLines: 1,
                        maxFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: AutoSizeText(
                        "Sede tirocinio: ${widget.progettoFormativo.idSedeTirocinio}",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 100,
                            decoration: TextDecoration.none,
                            color: TextColor_OnLight),
                        maxLines: 1,
                        maxFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: AutoSizeText(
                        "Stato DVR: ${widget.progettoFormativo.idPctoXAzienda}",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 100,
                            decoration: TextDecoration.none,
                            color: TextColor_OnLight),
                        maxLines: 1,
                        maxFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: visible ? 1 : 0,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 200),
                      child: AnimatedSize(
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: visible ? 200 : 0,
                          child: Text(
                            "note piano formativo",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                decoration: TextDecoration.none,
                                color: TextColor_OnLight),
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 1,
              child: Container(
                margin: visible
                    ? EdgeInsets.only(bottom: 15)
                    : EdgeInsets.only(bottom: 125),
                padding: EdgeInsets.all(5),
                width: 75,
                child: Transform.rotate(
                  angle: visible ? 90 * math.pi / 180 : -90 * math.pi / 180,
                  child: SvgPicture.asset(
                    'assets/icons_old/Back ICon.svg',
                    height: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
