import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/beans/Azienda.dart';
import 'dart:math' as math;
import '../../business/main_controller.dart';
import '../../constants.dart';

class ListElementAzienda extends StatefulWidget {
  final Azienda azienda;
  final int stato;

  const ListElementAzienda(
      {super.key, required this.azienda, required this.stato});

  @override
  State<ListElementAzienda> createState() => ListElementAziendaState();
}

class ListElementAziendaState extends State<ListElementAzienda> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    String stato = "";
    bool filtroStato = false;
    Color stateColorBack = HexColor("#C7C7C7");
    Color stateColorBorder = HexColor("#C7C7C7");
    Color stateColorText = HexColor("#C7C7C7");
    String first = widget.azienda.ragioneSociale.substring(0, 1);
    String azienda =
        widget.azienda.ragioneSociale.replaceFirst(first, first.toUpperCase());

    switch (widget.stato) {
      case 1:
        {
          stato = "Attiva";
          stateColorBack = activeColor_back;
          stateColorBorder = activeColor_border;
          stateColorText = activeColor_text;
        }
        break;
      case 2:
        {
          stato = "Non Attiva";
          stateColorBack = negativeColor_back;
          stateColorBorder = negativeColor_border;
          stateColorText = negativeColor_text;
        }
        break;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          visible = !visible;
        });
      },
      child: Visibility(
        visible: filtroAttive == widget.stato || filtroAttive == 0,
        child: Stack(
          fit: StackFit.loose,
          children: [
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              reverseDuration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: Container(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: AutoSizeText(
                          azienda,
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
                        margin: EdgeInsets.only(bottom: 5, right: 30),
                        child: AutoSizeText(
                          "Partita IVA: ${widget.azienda.pIVA}",
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
                          "Sede Legale: ${widget.azienda.sedeLegale}",
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
                          "Topic: ${widget.azienda.topic}",
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
                          "Stato convenzione: ${widget.azienda.statoConvenzione}",
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
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: AutoSizeText(
                          "Convenzione n: ${widget.azienda.nConvenzione}",
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
                      Visibility(
                        visible: visible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: AutoSizeText(
                                "DVR: ${widget.azienda.DVR}",
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
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: TextColor_OnLight),
                                  widget.azienda.note),
                            ),
                            SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.all(5),
                width: 100,
                decoration: BoxDecoration(
                    color: stateColorBack,
                    borderRadius: borderRadius,
                    border: Border.all(color: stateColorBorder, width: 2)),
                child: Center(
                  child: Text(
                    stato,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: stateColorText),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 1,
                child: Container(
                  margin: visible
                      ? EdgeInsets.only(bottom: 25)
                      : EdgeInsets.only(bottom: 170),
                  padding: EdgeInsets.all(5),
                  width: 75,
                  child: Transform.rotate(
                    angle: visible ? 90 * math.pi / 180 : -90 * math.pi / 180,
                    child: SvgPicture.asset(
                      'assets/icons_old/Back ICon.svg',
                      height: 25.0,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
