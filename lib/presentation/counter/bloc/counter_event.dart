part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecreasePressed extends CounterEvent {
  const CounterDecreasePressed({
    required this.decreaseValue
  });
  final int decreaseValue;
}

class CounterResetPressed extends CounterEvent {}
