class CounterState {
  final int counter;
  final int increment;

  const CounterState({this.counter, this.increment});

  factory CounterState.initial() => CounterState(counter: 0, increment: 1);
}
