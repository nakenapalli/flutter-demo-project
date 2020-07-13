import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String text;

  const CustomCard({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
