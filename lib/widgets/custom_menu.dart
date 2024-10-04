import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/pages/profile_setting.dart';
import '../constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/settings/general_settings.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String svgIconPath;
  final VoidCallback onTap;

  CustomListTile({
    required this.title,
    required this.svgIconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        svgIconPath,
        color: Colors.black54,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}

class CustomMenu extends StatelessWidget {
  final Color backgroundColor;
  final Color secondaryColor;
  final String headerImage;

  CustomMenu({
    required this.backgroundColor,
    required this.secondaryColor,
    required this.headerImage,
  });

  void dummy() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      surfaceTintColor: secondaryColor,
      backgroundColor: secondaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: HexColor('#FFFCF2'),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(headerImage),
                ),
              ),
            ),
          ),
          CustomListTile(
            title: 'Archivio',
            svgIconPath: 'assets/Icons/Book_Bookmark.svg',
            onTap: dummy,
          ),
          CustomListTile(
            title: 'Impostazioni',
            svgIconPath: 'assets/Icons/Settings.svg',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GeneralSettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}

// Usage in Scaffold
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      drawer: CustomMenu(
        backgroundColor: BackgroundColor,
        secondaryColor: SecondaryColor,
        headerImage: "assets/img/logo.png",
      ),
      body: Center(
        child: Text('My Home Page'),
      ),
    );
  }
}
