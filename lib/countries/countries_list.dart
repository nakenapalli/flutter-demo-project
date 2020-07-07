import 'package:flutter/material.dart';
import './country.dart';
import 'package:http/http.dart' as http;
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
    fetchCountryList().then((response) => setState(() {
          Iterable list = json.decode(response.body.countryList);
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

Future fetchCountryList() async {
  final response =
      await http.get('http://portal.cyberliver.com/user/countriesList');

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Get request failed');
  }
}
