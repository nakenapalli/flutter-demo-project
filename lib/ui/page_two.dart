import 'package:first_project/block/block.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class SetValues extends StatefulWidget {
  SetValues({Key key}) : super(key: key);

  @override
  _SetValuesState createState() => _SetValuesState();
}

class _SetValuesState extends State<SetValues> with WidgetsBindingObserver {
  final _counterController = TextEditingController();
  final _incrementController = TextEditingController();
  bool isSet = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlockProvider.of(context).currentValueStream.listen((event) {
        if (isSet == false) {
          _counterController.text = event.toString();
          _incrementController.text =
              BlockProvider.of(context).incrementBy.toString();
          isSet = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Set values")),
        body: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Counter"),
                controller: _counterController,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Increment"),
                controller: _incrementController,
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                onPressed: () {
                  if (isNumeric(_counterController.text) &&
                      isNumeric(_incrementController.text)) {
                    BlockProvider.of(context).changeIncrementDecrement(
                        int.tryParse(_counterController.text),
                        int.tryParse(_incrementController.text));
                    Navigator.pop(context);
                  } else {
                    print("Show a dialog box throws error");
                  }
                },
                child: Text("Set"),
              )
            ],
          ),
        ));
  }
}
