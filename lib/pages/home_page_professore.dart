import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfinale/home_sections/section_pf.dart';
import 'package:testfinale/home_sections/section_studenti.dart';
import 'package:testfinale/pages/profile_setting.dart';
import 'package:testfinale/widgets/custom_menu.dart';

import '../business/main_controller.dart';
import '../constants.dart';
import '../home_sections/section_aziende.dart';
import '../widgets/center_container.dart';
import '../widgets/privacy_widget.dart';

class HomePage_Professore extends StatefulWidget {
  const HomePage_Professore({super.key});

  @override
  State<HomePage_Professore> createState() => _HomePage_ProfessoreState();
}

class _HomePage_ProfessoreState extends State<HomePage_Professore> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BackgroundColor,
        drawer: CustomMenu(
          backgroundColor: BackgroundColor,
          secondaryColor: SecondaryColor,
          headerImage: "assets/img/logo.png",
        ),
        body: Builder(
          builder: (context) => Container(
            color: BackgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: SvgPicture.asset(
                              'assets/Icons/Menu_Dots.svg',
                              width: 40.0,
                              height: 40.0,
                              colorFilter: ColorFilter.mode(
                                  TextColor_OnDark, BlendMode.srcIn),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(0);
                              });
                            },
                            child: Container(
                              width: 80,
                              child: Center(
                                child: Text(
                                  "Aziende",
                                  style: TextStyle(
                                      fontFamily: "inter",
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: TextColor_OnLight),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: homePageViewIndex == 0
                                      ? AccentColor
                                      : ElementsColor_Light,
                                  borderRadius: borderRadius),
                              padding: EdgeInsets.all(5),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(1);
                              });
                            },
                            child: Container(
                              width: 85,
                              child: Center(
                                child: Text(
                                  "Studenti",
                                  style: TextStyle(
                                      fontFamily: "inter",
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: TextColor_OnLight),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: homePageViewIndex == 1
                                      ? AccentColor
                                      : ElementsColor_Light,
                                  borderRadius: borderRadius),
                              padding: EdgeInsets.all(5),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(2);
                              });
                            },
                            child: Container(
                              width: 80,
                              child: Center(
                                child: Text(
                                  "P.F.",
                                  style: TextStyle(
                                      fontFamily: "inter",
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: TextColor_OnLight),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: homePageViewIndex == 2
                                      ? AccentColor
                                      : ElementsColor_Light,
                                  borderRadius: borderRadius),
                              padding: EdgeInsets.all(5),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: CenterContainer(
                            child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          homePageViewIndex = index;
                        });
                      },
                      clipBehavior: Clip.none,
                      children: [
                        SectionAziende(),
                        SectionStudenti(),
                        SectionPf(),
                      ],
                    ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Policy(),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Visibility(
                    visible: false,
                    child: Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/img/logo.png"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
