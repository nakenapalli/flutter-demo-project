import 'package:first_project/models/models.dart';
import 'package:first_project/ui/common_files.dart';
import 'package:first_project/ui/page_two.dart';
import 'package:flutter/material.dart';
import 'package:first_project/block/block.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title})
      : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with  WidgetsBindingObserver{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlockProvider.of(context).changeCurrentValue(ActionsTaken.INITIAL);
    });
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: BlockProvider.of(context).currentValueStream,
      builder: (context,snap){
        if(!snap.hasData || snap.hasError){
          return showLoading();
        }
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
                      '${snap.data}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                        shape: const StadiumBorder(),
                        color: Colors.blue,
                        splashColor: Colors.blue[200],
                        textColor: Colors.white,
                        onPressed: (){
                          BlockProvider.of(context).changeCurrentValue(ActionsTaken.INCREMENT);
                        },
                        child: Text('Increase counter')),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Incrementing by: ${BlockProvider.of(context).incrementBy}',
                        style: TextStyle(fontSize: 20)),
                    SizedBox(width: 10),
                    RaisedButton(
                        shape: const StadiumBorder(),
                        color: Colors.blue,
                        splashColor: Colors.blue[200],
                        textColor: Colors.white,
                        onPressed: (){
                          BlockProvider.of(context).changeCurrentValue(ActionsTaken.INCREASE_INCREMENT);
                        },
                        child: Text('Increase increment')),
                  ],
                ),
                RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetValues(

                      ),
                    ),
                  ),
                  child: Text("Set values manually"),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              BlockProvider.of(context).changeCurrentValue(ActionsTaken.RESET);
            },
            splashColor: Colors.blue[200],
            tooltip: 'Refresh',
            child: Icon(Icons.refresh),
          ),
        );

      },
    );


  }
}