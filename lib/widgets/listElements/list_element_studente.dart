import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import '../../beans/Studente.dart';
import '../../business/main_controller.dart';
import '../../constants.dart';


class ListElementStudente extends StatefulWidget {
  final Studente studente;
  final bool filtroMaggiorenne;

  const ListElementStudente({super.key, required this.studente, required this.filtroMaggiorenne});

  @override
  State<ListElementStudente> createState() => ListElementStudenteState();
}

class ListElementStudenteState extends State<ListElementStudente> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    String first = widget.studente.cognome.substring(0, 1);
    String nomeCompleto = widget.studente.cognome.replaceFirst(first, first.toUpperCase()) + " " + widget.studente.nome;
    bool isMaggiorenne = widget.studente.isMaggiorenne();

    String stato = isMaggiorenne ? "Maggiorenne" : "Minorenne";
    Color stateColorBack = isMaggiorenne ? activeColor_back : waitingColor_back;
    Color stateColorBorder = isMaggiorenne ? activeColor_border : waitingColor_border;
    Color stateColorText = isMaggiorenne ? activeColor_text : waitingColor_text;

    return Visibility(
      visible: filtroEta==1 && isMaggiorenne || filtroEta==2 && isMaggiorenne==false || filtroEta==0 ,
      child: GestureDetector(
        onTap: () {
          setState(() {
            visible = !visible;
          });
        },
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
                      nomeCompleto,
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
                      "Classe: ${widget.studente.classe}",
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
                      "Comune di Nascita: ${widget.studente.comuneNascita}",
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
                      "Comune di Residenza: ${widget.studente.comuneResidenza}",
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
                      "Data di Nascita: ${widget.studente.dataNascita.toLocal().toString().split(' ')[0]}",
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
                  if (visible) ...[
                    Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: AutoSizeText(
                      "Stato: $stato",
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
                        "Indirizzo di Residenza: ${widget.studente.indirizzoResidenza}",
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
                        "PEI: ${widget.studente.pei}",
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
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.all(5),
                width: stato=="Minorenne" ? 100 : 115,
                decoration: BoxDecoration(
                  color: stateColorBack,
                  borderRadius: borderRadius,
                  border: Border.all(color: stateColorBorder, width: 2),
                ),
                child: Center(
                  child: Text(
                    stato,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: stateColorText,
                    ),
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
                    : EdgeInsets.only(bottom: 150),
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
