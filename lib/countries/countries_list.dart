import 'package:flutter/material.dart';
import './country.dart';
import './countries_api.dart' as api;
import 'dart:convert';

class CountriesList extends StatefulWidget {
  CountriesList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  List<Country> countryList;

  _getCountries() {
    api.fetchCountryList().then((response) => setState(() {
          var data = json.decode(response.body);
          Iterable list = data['countryList'] as List;
          countryList = list.map((model) => Country.fromJson(model)).toList();
        }));
  }

  @override
  void initState() {
    super.initState();
    _getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(countryList[index].countryName),
        ),
      ),
    );
  }
}
