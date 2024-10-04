import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testfinale/pages/profile_setting.dart';

import '../business/handlers_wrapper.dart';
import '../business/http_helper.dart';
import '../constants.dart';
import '../widgets/center_container.dart';
import '../widgets/custom_menu.dart';
import '../widgets/privacy_widget.dart';
import '../widgets/progettoFormativo_studente.dart';

class HomePageStudente extends StatefulWidget {
  const HomePageStudente({
    super.key,
  });

  @override
  State<HomePageStudente> createState() => _HomePageStudente();
}

class _HomePageStudente extends State<HomePageStudente> {
  late Timer _timer;
  bool mostraLogoCentrale = false;
  bool showTopMenu = true;
  bool progetto = true;
  String student =  "donadoni" ;//loginHandler.loggedStudent.getCognome;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    _timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => checkConnectivity());
  }

  @override
  void dispose() {
    _timer.cancel();
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
                    AbsorbPointer(
                      child: Opacity(
                        opacity: showTopMenu ? 1 : 0,
                        child: Container(
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    child: SvgPicture.asset(
                                      'assets/Icons/User.svg',
                                      width: 40.0,
                                      height: 40.0,
                                      colorFilter: ColorFilter.mode(
                                          TextColor_OnDark, BlendMode.srcIn),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileSettings()));
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      absorbing: !showTopMenu,
                    ),
                    Expanded(
                      child: CenterContainer(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, right: 20),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: SecondaryColor,
                          ),
                          child: SingleChildScrollView(
                            clipBehavior: Clip.none,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: BackgroundColor,
                                    borderRadius: borderRadius,
                                  ),
                                  width: double.infinity,
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.all(10),
                                  // Padding di 20 su tutti i lati
                                  child: Text(
                                    "IL TUO PROGETTO FORMATIVO",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "inter"),
                                  ),
                                ),
                                if (student == "cupardo")
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          "Nessun progetto formativo presente",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "inter",
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),


                                if ( student == "donadoni")
                                  ElementProgettoFormativo(
                                    azienda: "Wartsila",
                                    sede: "sede wartsila",
                                    tutor:
                                        "Emanuele Ascani, dwada wdaw dasdwadawd",
                                    orario: "10:00 - 17:30",
                                    descrizione: " Le attività che svolgiamo nella nostra azienda, Acme Solutions. La nostra azienda è leader nel settore della produzione di componenti elettronici di alta precisione. Ci occupiamo di progettare, sviluppare e produrre dispositivi che vengono utilizzati in una vasta gamma di applicazioni, dalle telecomunicazioni all’automotive, passando per l’aerospaziale e la medicina.Il nostro processo produttivo inizia con un'intensa fase di ricerca e sviluppo. Il nostro team di ingegneri e tecnici specializzati lavora incessantemente per innovare e migliorare i nostri prodotti, utilizzando le tecnologie più avanzate disponibili sul mercato. Siamo fieri di investire una parte significativa delle nostre risorse in questo settore, poiché crediamo fermamente che l'innovazione sia la chiave per mantenere il nostro vantaggio competitivo.Una volta completata la fase di progettazione, i nostri prodotti passano alla fase di produzione. Qui, utilizziamo macchinari all'avanguardia e un sistema di gestione della qualità rigoroso per garantire che ogni componente rispetti i più alti standard di precisione e affidabilità. Il nostro stabilimento di produzione è dotato di linee di assemblaggio automatizzate che permettono di mantenere elevati livelli di efficienza e di controllo della qualità.Non meno importante è il nostro impegno verso la sostenibilità. Abbiamo implementato numerose iniziative per ridurre l'impatto ambientale della nostra attività, come l'uso di materiali riciclabili e l'adozione di pratiche di produzione a basso consumo energetico. La responsabilità sociale è un valore fondamentale per noi e cerchiamo di contribuire positivamente alla comunità locale e all'ambiente globale.Infine, il nostro reparto vendite e assistenza clienti lavora a stretto contatto con i nostri clienti per garantire che le loro esigenze siano sempre soddisfatte. Offriamo un supporto continuo, dalla consulenza tecnica alla manutenzione post-vendita, per assicurarci che i nostri prodotti funzionino sempre al meglio delle loro capacità.In sintesi, Acme Solutions è un’azienda dinamica e innovativa, impegnata a fornire componenti elettronici di alta qualità, con un occhio di riguardo per l’ambiente e la comunità. Siamo orgogliosi del nostro lavoro e della fiducia che i nostri clienti ripongono in noi.",
                                  ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Policy(),
                    ),
                  ],
                ),
                Visibility(
                  visible: mostraLogoCentrale,
                  child: Align(
                    alignment: Alignment.topCenter,
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
