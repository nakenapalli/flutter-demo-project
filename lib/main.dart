import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './set_values.dart';
import './counter_bloc.dart';
import './counter_state.dart';

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
        home: MyHomePage(
          title: 'Counter Widget',
          state: CounterState.initial(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.state}) : super(key: key);

  final String title;
  final CounterState state;

  @override
  _MyHomePageState createState() => _MyHomePageState(CounterBloc(state));
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc;

  _MyHomePageState(this._counterBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
              bloc: _counterBloc,
              builder: (context, CounterState state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Counter value: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Text(
                          '${state.counter}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(width: 10),
                        RaisedButton(
                            shape: const StadiumBorder(),
                            color: Colors.blue,
                            splashColor: Colors.blue[200],
                            textColor: Colors.white,
                            onPressed: () => _counterBloc.onIncrement(),
                            child: Text('Increase counter')),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Incrementing by: ${state.increment}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(width: 10),
                        RaisedButton(
                            shape: const StadiumBorder(),
                            color: Colors.blue,
                            splashColor: Colors.blue[200],
                            textColor: Colors.white,
                            onPressed: () => _counterBloc.onUpIncrement(),
                            child: Text('Increase increment')),
                      ],
                    ),
                    RaisedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetValues(
                            counter: state.counter,
                            increment: state.increment,
                          ),
                        ),
                      ),
                      child: Text("Set values manually"),
                    ),
                  ],
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterBloc.onReset(),
        splashColor: Colors.blue[200],
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}
