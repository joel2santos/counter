part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({
    this.counter = 0,
    this.counterType = Counter.increment,
  });

  final int counter;
  final Counter counterType;

  @override
  List<Object> get props => [
        counter,
        counterType,
      ];

  CounterState copyWith({
    int? counter,
    Counter? counterType,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      counterType: counterType ?? this.counterType,
    );
  }
}
