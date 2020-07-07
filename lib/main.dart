import 'package:first_project/ui/first_page.dart';
import 'package:flutter/material.dart';
import 'block/block.dart';

void main() {
  runApp(MyApp());
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
