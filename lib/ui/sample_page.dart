import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget createCard(text) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    margin: EdgeInsets.all(16.0),
    elevation: 10.0,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            text,
            textDirection: TextDirection.ltr,
            style: GoogleFonts.roboto(),
            textScaleFactor: 1.2,
          ),
          SizedBox(height: 5.0),
          Text(
            text,
            textDirection: TextDirection.ltr,
            style: GoogleFonts.roboto(),
            textScaleFactor: 0.8,
          ),
        ],
      ),
    ),
  );
}

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
        child: Wrap(
          textDirection: TextDirection.ltr,
          spacing: 5.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: List.generate(6, (index) => createCard("Sample card")),
        ),
      ),
    );
  }
}
