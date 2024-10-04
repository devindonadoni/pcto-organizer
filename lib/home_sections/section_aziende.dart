import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../beans/Azienda.dart';
import '../business/handlers_wrapper.dart';
import '../constants.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/listElements/list_element_azienda.dart';

class SectionAziende extends StatefulWidget {
  const SectionAziende({super.key});

  @override
  State<SectionAziende> createState() => _SectionAziendeState();
}

class _SectionAziendeState extends State<SectionAziende> {
  List<Azienda> allAziende = [];
  List<Azienda> aziende = [];
  final TextEditingController searchController = TextEditingController();
  int filtroAttive = 0; // 1 => attiva | 2 => Non attiva
  bool isLoading = false;
  bool showSuccessTick = false;

  @override
  void initState() {
    super.initState();
    _fetchAziende(false);
  }

  void _fetchAziende(bool force_request) async {
    setState(() {
      isLoading = true;
    });

    List<Azienda> fetchedAziende = await aziendeHandler.getAziende(force_request);

    fetchedAziende.sort((a, b) => a.ragioneSociale.compareTo(b.ragioneSociale));

    setState(() {
      allAziende = fetchedAziende;
      aziende = searchController.text.isEmpty ? fetchedAziende : _filterAziende(searchController.text);
      isLoading = false;
    });
  }

  List<Azienda> _filterAziende(String query) {
    List<Azienda> filteredList = allAziende.where((azienda) {
      return azienda.ragioneSociale.toLowerCase().contains(query.toLowerCase()) ||
          azienda.pIVA.contains(query);
    }).toList();

    if (filtroAttive == 1) {
      filteredList = filteredList.where((azienda) => azienda.statoConvenzione.contains("SI") || azienda.statoConvenzione.contains("si")).toList();
    } else if (filtroAttive == 2) {
      filteredList = filteredList.where((azienda) => azienda.statoConvenzione.contains("NO") || azienda.statoConvenzione.contains("no")).toList();
    }
    return filteredList;
  }

  void handleSearch(String query) {
    setState(() {
      aziende = _filterAziende(query);
    });
  }

  List<Widget> fetchAziendeWidgets(List<Azienda> listaAziende) {
    return listaAziende.map((azienda) {
      int stato = 0;
      if (azienda.statoConvenzione.contains("si") || azienda.statoConvenzione.contains("SI")){
        stato = 1;
      } else if (azienda.statoConvenzione.contains("no") || azienda.statoConvenzione.contains("NO")){
        stato = 2;
      }
      return ListElementAzienda(
        azienda: azienda,
        stato: stato,
      );
    }).toList();
  }

  void _showAddAziendaDialog() {
    TextEditingController ragioneSocialeController = TextEditingController();
    TextEditingController pIVAController = TextEditingController();
    TextEditingController sedeLegaleController = TextEditingController();
    TextEditingController topicController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    TextEditingController statoConvenzioneController = TextEditingController();
    TextEditingController nConvenzioneController = TextEditingController();
    TextEditingController idDvrController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Aggiungi Azienda'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: ragioneSocialeController,
                  decoration: InputDecoration(labelText: 'Ragione Sociale'),
                ),
                TextField(
                  controller: pIVAController,
                  decoration: InputDecoration(labelText: 'Partita IVA'),
                ),
                TextField(
                  controller: sedeLegaleController,
                  decoration: InputDecoration(labelText: 'Sede Legale'),
                ),
                TextField(
                  controller: topicController,
                  decoration: InputDecoration(labelText: 'Topic'),
                ),
                TextField(
                  controller: noteController,
                  decoration: InputDecoration(labelText: 'Note'),
                ),
                TextField(
                  controller: statoConvenzioneController,
                  decoration: InputDecoration(labelText: 'Stato Convenzione'),
                ),
                TextField(
                  controller: nConvenzioneController,
                  decoration: InputDecoration(labelText: 'Numero Convenzione'),
                ),
                TextField(
                  controller: idDvrController,
                  decoration: InputDecoration(labelText: 'ID DVR'),
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
                Azienda newAzienda = Azienda(
                  id: 0, // ID will be set by the server
                  ragioneSociale: ragioneSocialeController.text,
                  pIVA: pIVAController.text,
                  sedeLegale: sedeLegaleController.text,
                  topic: topicController.text,
                  note: noteController.text,
                  statoConvenzione: statoConvenzioneController.text,
                  nConvenzione: nConvenzioneController.text,
                  DVR: int.parse(idDvrController.text),
                );

                bool success = await aziendeHandler.addAzienda(newAzienda);

                if (success) {
                  _fetchAziende(true);
                  Navigator.of(context).pop();
                  setState(() {
                    showSuccessTick = true;
                  });
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      showSuccessTick = false;
                    });
                  });
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
          _fetchAziende(true);
        },
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(top: 20),
          child: isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: CustomSearchBar(
                    controller: searchController,
                    onChanged: handleSearch,
                    onSearch: () {
                      handleSearch(searchController.text);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Filtra aziende per:",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: TextColor_OnLight),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Text("Attive",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: TextColor_OnLight)),
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: filtroAttive == 1
                                  ? AccentColor
                                  : SecondaryColor,
                              borderRadius: borderRadius,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ]),
                        ),
                        onTap: () {
                          setState(() {
                            filtroAttive = filtroAttive == 1 ? 0 : 1;
                            aziende = _filterAziende(searchController.text);
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Text("Non attiva",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: TextColor_OnLight)),
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: filtroAttive == 2
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
                              ]),
                        ),
                        onTap: () {
                          setState(() {
                            filtroAttive = filtroAttive == 2 ? 0 : 2;
                            aziende = _filterAziende(searchController.text);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ...fetchAziendeWidgets(aziende),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showAddAziendaDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: AccentColor,
      ),
    );
  }
}
