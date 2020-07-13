import 'package:flutter/material.dart';
import 'package:first_project/models/custom_card.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample UI"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Wrap(
            textDirection: TextDirection.ltr,
            spacing: 5.0,
            runSpacing: 5.0,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: List.generate(
              20,
              (index) => CustomCard(text: "Sample card"),
            ),
          ),
        ),
      ),
    );
  }
}
