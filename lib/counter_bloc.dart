import "package:bloc/bloc.dart";
import "./counter_event.dart";
import "./counter_state.dart";

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  void onIncrement() {
    add(IncrementEvent());
  }

  void onUpIncrement() {
    add(UpIncrementEvent());
  }

  void onReset() {
    add(ResetEvent());
  }

  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    final _currentState = state;
    if (event is IncrementEvent) {
      yield CounterState(
        counter: _currentState.counter + _currentState.increment,
        increment: _currentState.increment,
      );
    } else if (event is UpIncrementEvent) {
      yield CounterState(
        counter: _currentState.counter,
        increment: _currentState.increment + 1,
      );
    } else if (event is ResetEvent) {
      yield CounterState.initial();
    }
  }
}
