import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class ElementProgettoFormativo extends StatefulWidget {
  final String azienda;
  final String sede;
  final String tutor;
  final String orario;
  final String descrizione;
  const ElementProgettoFormativo({super.key,required this.azienda,required this.sede, required this.tutor,required this.orario, required this.descrizione});
  @override
  State<ElementProgettoFormativo> createState() => ElementProgettoFormativoState();

}

class ElementProgettoFormativoState extends State<ElementProgettoFormativo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 30, left: 1, right: 1),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor("#D9D9D9"),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 5,
            blurStyle: BlurStyle.normal,
            blurRadius: 9,
            offset: Offset(0,
                3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 10, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.azienda,
                style: TextStyle(
                    fontSize: 45,
                    fontFamily: "inter",
                    fontWeight:
                    FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 20, right: 10),
                child: SvgPicture.asset(
                  'assets/Icons/GPS.svg',
                  width: 32.0,
                  height: 32.0,
                  colorFilter: ColorFilter.mode(AccentColor, BlendMode.srcIn),
                ),
              ),
              Container(
                child: Text(
                  widget.sede,
                  style: TextStyle(
                      fontFamily: "inter",
                      fontSize: 16),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10),
              padding:
              EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: HexColor(
                              "#696969"),
                          width: 2.0))),
              child: Text(
                "Informazioni utili",
                style: TextStyle(
                  color: HexColor("#696969"),
                  fontFamily: "inter",
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 20,
                    right: 10,
                    bottom: 10),
                child: SvgPicture.asset(
                  'assets/Icons/User_Id.svg',
                  width: 30.0,
                  height: 30.0,
                  colorFilter: ColorFilter.mode(AccentColor, BlendMode.srcIn),

                ),
              ),
              Container(
                child: Flexible(
                  child: AutoSizeText(
                   widget.tutor,
                    maxLines: 2,
                    style: TextStyle(
                  
                        fontSize: 18,
                        fontFamily: "inter"),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 20, right: 10),
                child: SvgPicture.asset(
                  'assets/Icons/Clock_Square.svg',
                  width: 30.0,
                  height: 30.0,
                  colorFilter: ColorFilter.mode(AccentColor, BlendMode.srcIn),

                ),
              ),
              Container(
                child: Text(
                 widget.orario,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "inter"),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 10),
              padding:
              EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: HexColor(
                              "#696969"),
                          width: 2.0))),
              child: Text(
                "Descrizione attivita",
                style: TextStyle(
                  color: HexColor("#696969"),
                  fontFamily: "inter",
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: 20, right: 20),
            child: Text(
              widget.descrizione,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: "inter"),
            ),
          )
        ],
      ),
    );
  }
}
