import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testfinale/beans/Studente.dart';
import '../business/handlers_wrapper.dart';
import '../constants.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/listElements/list_element_studente.dart';

class SectionStudenti extends StatefulWidget {
  const SectionStudenti({super.key});

  @override
  State<SectionStudenti> createState() => _SectionStudentiState();
}

class _SectionStudentiState extends State<SectionStudenti> {
  Future<void> _pullRefresh() async {
    setState(() {
      isLoading = true;
    });

    List<Studente> freshStudenti = await studentiHandler.getStudenti(false);

    setState(() {
      allStudenti = freshStudenti;
      studenti = _filterStudenti(searchController.text);
      isLoading = false;
    });
  }

  List<Studente> allStudenti = [];
  List<Studente> studenti = [];
  final TextEditingController searchController = TextEditingController();
  int filtroEta = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchStudenti(false);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _fetchStudenti(bool force_request) async {
    setState(() {
      isLoading = true;
    });

    List<Studente> fetchedStudenti;

    fetchedStudenti = await studentiHandler.getStudenti(force_request);

    fetchedStudenti.sort((a, b) => a.cognome.compareTo(b.cognome));

    setState(() {
      allStudenti = fetchedStudenti;
      studenti = _filterStudenti(searchController.text);
      isLoading = false;
    });
  }

  List<Studente> _filterStudenti(String query) {
    List<Studente> filteredList = allStudenti.where((studente) {
      return studente.nome.toLowerCase().contains(query.toLowerCase()) ||
          studente.cognome.toLowerCase().contains(query.toLowerCase()) ||
          studente.classe.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filtroEta == 1) {
      filteredList = filteredList.where((studente) => studente.isMaggiorenne()).toList();
    } else if (filtroEta == 2) {
      filteredList = filteredList.where((studente) => !studente.isMaggiorenne()).toList();
    }

    return filteredList;
  }

  void handleSearch(String query) {
    setState(() {
      studenti = _filterStudenti(query);
    });
  }

  List<Widget> fetchStudentiWidgets(List<Studente> listaStudenti) {
    return listaStudenti.map((studente) {
      return ListElementStudente(
        studente: studente,
        filtroMaggiorenne: studente.isMaggiorenne(),
      );
    }).toList();
  }

  void _showAddStudenteDialog() {
    TextEditingController nomeController = TextEditingController();
    TextEditingController cognomeController = TextEditingController();
    TextEditingController classeController = TextEditingController();
    TextEditingController comuneNascitaController = TextEditingController();
    TextEditingController dataNascitaController = TextEditingController();
    TextEditingController comuneResidenzaController = TextEditingController();
    TextEditingController indirizzoResidenzaController = TextEditingController();
    TextEditingController peiController = TextEditingController();
    TextEditingController idPctoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Aggiungi Studente'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: cognomeController,
                  decoration: InputDecoration(labelText: 'Cognome'),
                ),
                TextField(
                  controller: classeController,
                  decoration: InputDecoration(labelText: 'Classe'),
                ),
                TextField(
                  controller: comuneNascitaController,
                  decoration: InputDecoration(labelText: 'Comune di Nascita'),
                ),
                TextField(
                  controller: dataNascitaController,
                  decoration: InputDecoration(labelText: 'Data di Nascita (YYYY-MM-DD)'),
                ),
                TextField(
                  controller: comuneResidenzaController,
                  decoration: InputDecoration(labelText: 'Comune di Residenza'),
                ),
                TextField(
                  controller: indirizzoResidenzaController,
                  decoration: InputDecoration(labelText: 'Indirizzo di Residenza'),
                ),
                TextField(
                  controller: peiController,
                  decoration: InputDecoration(labelText: 'PEI'),
                ),
                TextField(
                  controller: idPctoController,
                  decoration: InputDecoration(labelText: 'ID PCTO'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Annulla'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Aggiungi'),
              onPressed: () async {
                Studente newStudente = Studente(
                  id: 0, // ID will be set by the server
                  nome: nomeController.text,
                  cognome: cognomeController.text,
                  classe: classeController.text,
                  comuneNascita: comuneNascitaController.text,
                  dataNascita: DateTime.parse(dataNascitaController.text),
                  comuneResidenza: comuneResidenzaController.text,
                  indirizzoResidenza: indirizzoResidenzaController.text,
                  pei: peiController.text,
                  idPcto: int.parse(idPctoController.text),
                );

                bool success = await studentiHandler.addStudente(newStudente);

                if (success) {
                  _fetchStudenti(true);
                  Navigator.of(context).pop();
                } else {
                  // Handle error
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SecondaryColor,
      body: RefreshIndicator(
        onRefresh: () async {
          _fetchStudenti(true);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 20),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomSearchBar(
                    controller: searchController,
                    onChanged: handleSearch,
                    onSearch: () {
                      handleSearch(searchController.text);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Filtra studenti per:",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    color: TextColor_OnLight,
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Text(
                            "Minorenne",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: TextColor_OnLight,
                            ),
                          ),
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: filtroEta == 2
                                ? AccentColor
                                : ElementsColor_Light,
                            borderRadius: borderRadius,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            filtroEta = filtroEta == 2 ? 0 : 2;
                            studenti = _filterStudenti(searchController.text);
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Text(
                            "Maggiorenne",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: TextColor_OnLight,
                            ),
                          ),
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: filtroEta == 1
                                ? AccentColor
                                : ElementsColor_Light,
                            borderRadius: borderRadius,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            filtroEta = filtroEta == 1 ? 0 : 1;
                            studenti = _filterStudenti(searchController.text);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                ...fetchStudentiWidgets(studenti),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showAddStudenteDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: AccentColor,
      ),
    );
  }
}
