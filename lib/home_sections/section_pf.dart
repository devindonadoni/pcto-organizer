import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testfinale/beans/ProgettoFormativo.dart';
import '../business/handlers_wrapper.dart';
import '../constants.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/listElements/list_element_piano_formativo.dart';

class SectionPf extends StatefulWidget {
  const SectionPf({super.key});

  @override
  State<SectionPf> createState() => _SectionPfState();
}

class _SectionPfState extends State<SectionPf> {
  List<ProgettoFormativo> allProgettiFormativi = [];
  List<ProgettoFormativo> progettiFormativi = [];
  final TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchAziende();
    Timer.periodic(Duration(seconds: 10), (Timer t) => _fetchAziende());
  }

  Future<void> _fetchAziende() async {
    setState(() {
      isLoading = true;
    });

    List<ProgettoFormativo> fetchProgettiFormativi = await progettiFormativiHandler.getProgettiFormativi(false);

    fetchProgettiFormativi.sort((a, b) => a.descrizioneAttivita.compareTo(b.descrizioneAttivita));

    setState(() {
      allProgettiFormativi = fetchProgettiFormativi;
      progettiFormativi = searchController.text.isEmpty
          ? fetchProgettiFormativi
          : _filterProgettiFormativi(searchController.text);
      isLoading = false;
    });
  }

  List<Widget> fetchAziendeWidgets(List<ProgettoFormativo> listProgettiFormativi) {
    return listProgettiFormativi.map((progettoFormativo) {
      return ListElementProgettoFormativo(
        progettoFormativo: progettoFormativo,
      );
    }).toList();
  }

  List<ProgettoFormativo> _filterProgettiFormativi(String query) {
    return allProgettiFormativi.where((progettoFormativo) {
      return progettoFormativo.descrizioneAttivita
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
  }

  void handleSearch(String query) {
    List<ProgettoFormativo> filteredProgettiFormativi = allProgettiFormativi.where((progettoFormativo) {
      return progettoFormativo.descrizioneAttivita
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    setState(() {
      progettiFormativi = filteredProgettiFormativi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SecondaryColor,
      body: RefreshIndicator(
        onRefresh: _fetchAziende,
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(top: 20),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
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
                SizedBox(
                  height: 5,
                ),
                ...fetchAziendeWidgets(progettiFormativi),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add Progetto Formativo logic
        },
        child: Icon(Icons.add),
        backgroundColor: AccentColor,
      ),
    );
  }
}
