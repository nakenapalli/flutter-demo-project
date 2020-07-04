import 'package:flutter/material.dart';
import './set_values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Counter Widget', counter: 0, increment: 1));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.counter, this.increment})
      : super(key: key);

  final String title;
  final int counter;
  final int increment;

  @override
  _MyHomePageState createState() => _MyHomePageState(counter, increment);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter;
  int _increment;

  _MyHomePageState(this._counter, this._increment);

  void _incrementCounter() {
    setState(() {
      _counter += _increment;
    });
  }

  void _upIncrement() {
    setState(() {
      _increment++;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _increment = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Counter value: ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(width: 10),
                RaisedButton(
                    shape: const StadiumBorder(),
                    color: Colors.blue,
                    splashColor: Colors.blue[200],
                    textColor: Colors.white,
                    onPressed: _incrementCounter,
                    child: Text('Increase counter')),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Incrementing by: $_increment',
                    style: TextStyle(fontSize: 20)),
                SizedBox(width: 10),
                RaisedButton(
                    shape: const StadiumBorder(),
                    color: Colors.blue,
                    splashColor: Colors.blue[200],
                    textColor: Colors.white,
                    onPressed: _upIncrement,
                    child: Text('Increase increment')),
              ],
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetValues(
                    counter: _counter,
                    increment: _increment,
                  ),
                ),
              ),
              child: Text("Set values manually"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        splashColor: Colors.blue[200],
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
