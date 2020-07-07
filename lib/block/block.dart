import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:first_project/models/models.dart';
import 'package:flutter/material.dart';

class BlockPattern {

  final _currentValueSubject = BehaviorSubject<int>();

  Stream<int> get currentValueStream => _currentValueSubject.stream;

  int incrementBy = 1;

  void changeCurrentValue(dynamic action) {
    if(action == ActionsTaken.INITIAL){
      _currentValueSubject.add(0);
      incrementBy = 1;
    }
    else{
      bool isSet = false;
      currentValueStream.listen((value) {
        print(value);
        if(isSet == false){
          switch (action) {
            case ActionsTaken.INCREMENT:
              _currentValueSubject.add(value + incrementBy);
              break;
            case ActionsTaken.DECREMENT:
              _currentValueSubject
                  .add(value >= incrementBy ? 0 : value - incrementBy);
              break;
            case ActionsTaken.RESET:
              _currentValueSubject.add(0);
              incrementBy = 1;
              break;
            case ActionsTaken.INCREASE_INCREMENT:
              _currentValueSubject.add(value);
              incrementBy = incrementBy + 1;
              break;
            default:
              break;
          }
          isSet = true;
        }

      });
    }

  }

  void changeIncrementDecrement(int increment, int currentValue) {
    _currentValueSubject.add(currentValue);
    incrementBy = increment;
  }
}

class BlockProvider extends InheritedWidget {
  BlockPattern pattern;

  BlockProvider({Key key, BlockPattern getPattern, Widget child})
      : assert(getPattern != null),
        pattern = getPattern,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static BlockPattern of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlockProvider) as BlockProvider)
          .pattern;
}
