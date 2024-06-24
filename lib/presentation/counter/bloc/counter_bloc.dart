import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecreasePressed>(_onDecreasePressed);
    on<CounterResetPressed>(_onResetPressed);
  }

  void _onIncrementPressed(
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ) {
    final counter = state.counter;
    emit(
      state.copyWith(
        counter: counter + 1
      )
    );
  }

  void _onDecreasePressed(
    CounterDecreasePressed event,
    Emitter<CounterState> emit,
  ) {
    final counter = state.counter;
    final decreaseValue = event.decreaseValue;

    emit(
      state.copyWith(
        counter: counter - decreaseValue,
      )
    );
  }

  void _onResetPressed(
    CounterResetPressed event,
    Emitter<CounterState> emit,
  ) { 
    emit(
      state.copyWith(
        counter: 0
      )
    );
  }
}
