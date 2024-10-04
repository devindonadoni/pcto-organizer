import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testfinale/business/data_handler.dart';
import 'package:testfinale/pages/home_page_studente.dart';
import 'package:testfinale/widgets/privacy_widget.dart';
import 'package:testfinale/widgets/profileComplete_form.dart';
import '../business/handlers_wrapper.dart';
import '../business/main_controller.dart';
import '../constants.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cognomeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController statoController = TextEditingController();
  final TextEditingController cittaController = TextEditingController();

  String stato = loginHandler.loggedStudent.getIndirizzoResidenza;
  String citta = loginHandler.loggedStudent.getComuneNascita;

  String date = "Data di nascita";
  bool dataComplete = false;

  @override
  void dispose() {
    nomeController.dispose();
    cognomeController.dispose();
    passwordController.dispose();
    statoController.dispose();
    cittaController.dispose();
    super.dispose();
  }

  void _saveData() {
    if (passwordController.text.isEmpty ||
        statoController.text.isEmpty ||
        cittaController.text.isEmpty) {
      setState(() {
        dataComplete = false;
      });
    } else {
      String nome = nomeController.text;
      String cognome = cognomeController.text;
      String codiceFiscale = passwordController.text;
      String stato = statoController.text;
      String citta = cittaController.text;
      String bDate = date;

      print("Codice Fiscale: $codiceFiscale");
      print("Stato: $stato");
      print("Citta: $citta");
      print("data: $bDate");
      dataComplete = true;
    }
  }

  void openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        "",
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: SecondaryColor,
      onChange: (index) {
        setState(() {
          HapticFeedback.heavyImpact();
        });
      },
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: TextStyle(fontSize: 25),
      onSubmit: (d) {
        setState(() {
          d = DateFormat("dd-MM-yyyy").format(d);
          print(d);
          date = d;
        });
      },
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                        'assets/Icons/User.svg',
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 25, left: 20),
                          child: Text(
                            "Completa il tuo profilo!",
                            style: TextStyle(
                              color: TextColor_OnLight,
                              decoration: TextDecoration.none,
                              fontSize: 30,
                              fontFamily: "inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ProfileCompleteForm(
                          nome: loginHandler.loggedStudent.getNome,
                          categoria: "Nome",
                          controller: nomeController,
                        ),
                        ProfileCompleteForm(
                          nome: loginHandler.loggedStudent.getCognome,
                          categoria: "Cognome",
                          controller: cognomeController,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: HexColor("#AFAFAF"),
                                width: 2.0,
                              ),
                            ),
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "MANCANO ALCUNI DATI",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ProfileCompleteForm(
                          nome: "Password",
                          categoria: "Nuova password",
                          editable: true,
                          controller: passwordController,
                        ),

                        ProfileData(
                          nome2: stato.isEmpty ? "Citta" : stato,
                          nome: citta.isEmpty ? "Via" : citta,
                          categoria: "Dati anagrafici",
                          editable: stato == "" && citta == "",
                          nomeController: cittaController,
                          nome2Controller: statoController,
                        ),


                        GestureDetector(
                          onTap: () {
                            openDatePicker(context);
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#D9D9D9"),
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(
                              date,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: HexColor("#C73930"),
                                  border: Border.all(
                                    color: HexColor("#CA2803"),
                                    width: 2.0,
                                  ),
                                ),
                                child: Text(
                                  "ANNULLA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _saveData();
                                if (dataComplete) {
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Center(
                                      child: Text(
                                        "Assicurati di compilare tutti i campi.",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    profileComlpeted = true;
                                    saveCompletionState(profileComlpeted);
                                    print(profileComlpeted);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageStudente()
                                        ));
                                  });

                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: BackgroundColor,
                                  border: Border.all(
                                    color: BackgroundColor,
                                    width: 2.0,
                                  ),
                                ),
                                child: Text(
                                  "SALVA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
