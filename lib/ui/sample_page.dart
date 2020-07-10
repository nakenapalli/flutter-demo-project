import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample UI"),
      ),
      body: Container(
        child: Wrap(
          textDirection: TextDirection.ltr,
          spacing: 5.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            Card(
              child: Text(
                "Sample card",
                textDirection: TextDirection.ltr,
              ),
            ),
            Card(
              child: Text(
                "Sample card",
                textDirection: TextDirection.ltr,
              ),
            ),
            Card(
              child: Text(
                "Sample card",
                textDirection: TextDirection.ltr,
              ),
            ),
            Card(
              child: Text(
                "Sample card",
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
