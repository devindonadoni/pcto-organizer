import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Policy extends StatefulWidget {
  const Policy({
    super.key,
  });

  @override
  State<Policy> createState() => PolicyState();
}

class PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("object");
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Termini e condizioni",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.none,
                fontFamily: "Inter"),
          ),
          SizedBox(width: 10),
          Text(
            "&",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: "Inter"),
          ),
          SizedBox(width: 10),
          Text(
            "Privacy dei dati",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: "Inter"),
          ),
        ],
      ),
    );
  }
}
