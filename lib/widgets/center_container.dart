import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CenterContainer extends StatefulWidget {
  final Widget child;
  const CenterContainer({super.key, this.child=const Material(),});
  @override
  State<CenterContainer> createState() => CenterContainerState();

}

class CenterContainerState extends State<CenterContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: MarginBottom,
      clipBehavior: Clip.hardEdge,

      decoration: BoxDecoration(
        color: ElementsColor_Light,
        borderRadius: borderRadius
      ),
      child: widget.child,
    );
  }
}
