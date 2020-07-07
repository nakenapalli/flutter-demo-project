import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
import './main.dart';
import './counter_state.dart';

class SetValues extends StatefulWidget {
  final int counter;
  final int increment;

  SetValues({Key key, this.counter, this.increment}) : super(key: key);

  @override
  _SetValuesState createState() => _SetValuesState();
}

class _SetValuesState extends State<SetValues> {
  final _counterController = TextEditingController();
  final _incrementController = TextEditingController();

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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      title: "Counter Widget",
                      state: CounterState(
                        counter: int.parse(_counterController.text),
                        increment: int.parse(_incrementController.text),
                      ),
                    ),
                  ),
                ),
                child: Text("Set"),
              )
            ],
          ),
        ));
  }
}
