import 'package:first_project/ui/first_page.dart';
import 'package:flutter/material.dart';
import 'block/block.dart';
import 'countries/countries_list.dart';
import 'ui/sample_page.dart';

void main() {
  runApp(SampleUI());
}

class MyApp extends StatelessWidget {
  final BlockPattern pattern = BlockPattern();

  @override
  Widget build(BuildContext context) {
    return BlockProvider(
      getPattern: pattern,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Counter Widget')),
    );
  }
}

class CountriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Http Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CountriesList(
          title: 'Countries List',
        ));
  }
}

class SampleUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SamplePage(),
    );
  }
}
