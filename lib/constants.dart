import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

var PrimaryColor = HexColor("#053259");   //blue
var SecondaryColor = HexColor("#D9D8D8"); //CDC5BA
var ElementsColor = HexColor("#403D38");
var ElementsColor_Light = HexColor("#D9D9D9");
var AccentColor = HexColor("#D9763D");
var BackgroundColor = HexColor("#053259"); //blue

/*
active sta per le cose in stato attivo
waiting per cose in stato contattato
negative per cose non attive
inective per le aziende disattivate
 */

//active
var activeColor_back = HexColor("#53DF61");
var activeColor_border = HexColor("#3CA547");
var activeColor_text = HexColor("#EAEAEA");

var waitingColor_back = HexColor("#E2E537");
var waitingColor_border = HexColor("#C0C22D");
var waitingColor_text = HexColor("#000000");

var negativeColor_back  = HexColor("#DF5353");
var negativeColor_border = HexColor("#AC4242");
var negativeColor_text = HexColor("#EAEAEA");

var inactiveColor_back  = HexColor("#C7C7C7");
var inactiveColor_border = HexColor("#939393");
var inactiveColor_text = HexColor("#000000");

//sezione forme
var borderRadius = BorderRadius.circular(20);
var MarginBottom = EdgeInsets.only(bottom: 10);
var paddingCentrale = EdgeInsets.only(left: 20, right: 20, top: 20);
//sezione colori testo
var TextColor_OnLight = HexColor("#403D38");
var TextColor_OnDark = HexColor("#FFFDF1");

var textStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    decoration: TextDecoration.none,
    color: TextColor_OnLight);

class Testo extends StatefulWidget {
  final String testo;

  const Testo({
    super.key,
    this.testo = "",
  });

  @override
  State<Testo> createState() => TestoS();
}

class TestoS extends State<Testo> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.testo,
      style: TextStyle(
          fontSize: 100,
          decoration: TextDecoration.none,
          color: TextColor_OnDark),
    );
  }
}
