import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/constants.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return AccentColor;
    }

    return Transform.scale(
      scale: 1.5, // Increases the size of the checkbox including the check mark
      child: Checkbox(
        checkColor: Colors.white,  // Color of the checkmark
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        side:  BorderSide(
          color: HexColor("#A55527"),  // Border color
          width: 2.0,  // Thickness of the border
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
