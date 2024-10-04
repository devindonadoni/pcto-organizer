import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfinale/widgets/profile_field.dart';
import 'package:testfinale/widgets/privacy_widget.dart';
import 'package:testfinale/business/handlers_wrapper.dart';

import '../constants.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: BackgroundColor),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: SvgPicture.asset(
                      'assets/icons/User.svg',
                      width: 40.0,
                      height: 80.0,
                      colorFilter:
                          ColorFilter.mode(TextColor_OnDark, BlendMode.srcIn),
                    ),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      child: Icon(
                        Icons.arrow_back,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  top: 0,
                  left: 0,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: SecondaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Text(
                              "Il tuo profilo",
                              style: TextStyle(
                                  color: TextColor_OnLight,
                                  decoration: TextDecoration.none,
                                  fontSize: 40,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          ProfileField(
                              categoria: "Nome",
                              nome: loginHandler.loggedStudent.getNome),
                          ProfileField(
                              categoria: "Cognome",
                              nome: loginHandler.loggedStudent.getCognome),
                          ProfileField(
                              categoria: "Data",
                              nome: loginHandler.loggedStudent.getDataNascita
                                  .toString()),
                          ProfileField(
                            categoria: "Residenza",
                            nome: loginHandler
                                .loggedStudent.getIndirizzoResidenza,
                          ),
                          ProfileField(
                              categoria: "Luogo di Nascita",
                              nome:
                                  loginHandler.loggedStudent.getComuneNascita),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Policy(),
            ),
          ],
        ),
      ),
    );
  }
}
