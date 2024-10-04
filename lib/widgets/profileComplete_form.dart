import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:testfinale/constants.dart';

class ProfileCompleteForm extends StatefulWidget {
  final String nome;
  String categoria;
  bool editable = false;
  final TextEditingController controller;

  ProfileCompleteForm(
      {super.key,
      required this.nome,
      this.categoria = "",
      this.editable = false,
      required this.controller});

  @override
  State<ProfileCompleteForm> createState() => _ProfileCompleteForm();
}

class _ProfileCompleteForm extends State<ProfileCompleteForm> {
  @override
  Widget build(BuildContext context) {
    String categoria = widget.categoria;
    bool editable = widget.editable;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "$categoria",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: HexColor('#7D7D7D'),
                    fontSize: 15,
                    fontFamily: "inter",
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: GestureDetector(
              onTap: () {},
              child: TextField(
                controller: widget.controller,
                enabled: editable,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide
                      (color: HexColor("#AFAFAF")), // Colore del bordo quando il TextField è focussato
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide
                      (color: HexColor("#AFAFAF")), // Colore del bordo quando il TextField è selezionato
                  ),
                  hintText: widget.nome,
                  filled: true,
                  fillColor: HexColor("#D9D9D9"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: HexColor("#AFAFAF")),
                  ),
                ),
                style: TextStyle(
                  fontSize: 17,
                  color: HexColor("#878787"),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileData extends StatefulWidget {
  final String nome;
  String categoria;
  final String nome2;
  bool editable = false;
  final TextEditingController nomeController;
  final TextEditingController nome2Controller;

  ProfileData(
      {super.key,
      required this.nome2,
      required this.nome,
      this.categoria = "",
      this.editable = false,
      required this.nomeController,
      required this.nome2Controller});

  @override
  State<ProfileData> createState() => _ProfileData();
}

class _ProfileData extends State<ProfileData> {
  @override
  Widget build(BuildContext context) {
    String categoria = widget.categoria;
    bool editable = widget.editable;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "$categoria",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: HexColor('#7D7D7D'),
                    fontSize: 15,
                    fontFamily: "inter",
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                    child: TextField(
                      controller: widget.nomeController,
                      enabled: editable,
                      cursorColor: AccentColor,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide
                            (color: HexColor("#AFAFAF")), // Colore del bordo quando il TextField è selezionato
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide
                            (color: HexColor("#AFAFAF")), // Colore del bordo quando il TextField è selezionato
                        ),
                        hintText: widget.nome,
                        filled: true,
                        fillColor: HexColor("#D9D9D9"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: HexColor("#AFAFAF")),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        color: HexColor("#878787"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    margin: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                    child: TextField(
                      controller: widget.nome2Controller,
                      enabled: editable,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide
                            (color: HexColor("#AFAFAF")), // Colore del bordo quando il TextField è selezionato
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide
                            (color: HexColor("#AFAFAF")), // Colore del bordo quando il TextField è selezionato
                        ),
                        hintText: widget.nome2,
                        filled: true,
                        fillColor: HexColor("#D9D9D9"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: HexColor("#AFAFAF")),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        color: HexColor("#878787"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileFiles extends StatefulWidget {
  final String categoria;
  final String percorso = 'assets/icons/Close_Circle.svg';
  bool state = false;

  ProfileFiles({
    super.key,
    required this.categoria,
  });

  @override
  State<ProfileFiles> createState() => _ProfileFilesState();
}

class _ProfileFilesState extends State<ProfileFiles> {
  String? selectedFilePath;
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFilePath =
            result.files.single.path;
        widget.state = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String categoria = widget.categoria;
    String percorso =
        widget.state ? 'assets/Icons/Verified_Check.svg' : widget.percorso;
    bool state = widget.state;

    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      categoria,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: HexColor('#696969'),
                        fontSize: 20,
                        fontFamily: "inter",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    _pickFile();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: HexColor("#DC7B41"),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: HexColor("#F2A35E"),
                        width: 2.0,
                      ),
                    ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        HexColor("#F2A35E"),
                        BlendMode.srcIn,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          'assets/icons/Upload.svg',
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 45,
            right: 25,
            child: SvgPicture.asset(
              percorso,
              width: 30,
              height: 30,
              color: state ? HexColor("#F2A35E") : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
