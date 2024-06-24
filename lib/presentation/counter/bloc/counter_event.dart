part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterPressed extends CounterEvent {
  const CounterPressed({
    this.counterValue,
    this.counterType,
  });

  final int? counterValue;
  final Counter? counterType;
}
