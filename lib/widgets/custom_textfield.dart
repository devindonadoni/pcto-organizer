import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function() onSearch;
  final String hintText;
  final SvgPicture icon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onSearch,
    this.hintText = '',
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ElementsColor_Light,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: HexColor("#C7C7C7"), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: TextColor_OnLight,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: TextColor_OnLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
