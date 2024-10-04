import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constants.dart';

class ProfileField extends StatefulWidget {
  final bool editable;
  final String categoria;
  final String nome;

  ProfileField(
      {super.key,
      this.editable = false,
      required this.categoria,
      required this.nome});

  @override
  State<ProfileField> createState() => _FormFieldState();
}

class _FormFieldState extends State<ProfileField> {
  @override
  Widget build(BuildContext context) {
    String categoria = widget.categoria;
    String nome = widget.nome;
    bool editable = widget.editable;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$categoria",
            style: TextStyle(
                color: HexColor('#7D7D7D'),
                decoration: TextDecoration.none,
                fontFamily: "inter",
                fontWeight: FontWeight.normal,
                fontSize: 25),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/modifica.svg',
                  width: 30.0,
                  height: 30.0,
                  colorFilter:
                      ColorFilter.mode(TextColor_OnLight, BlendMode.srcIn),
                ),
                Expanded(
                  child: AutoSizeText(
                    maxLines: 2,
                    "$nome",
                    style: TextStyle(
                      fontFamily: "inter",
                      color: TextColor_OnLight,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      //qui
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Visibility(
                      visible: editable,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, bottom: 5),
                        child: SvgPicture.asset(
                          'assets/icons/Pen_2.svg',
                          width: 30.0,
                          height: 30.0,
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
