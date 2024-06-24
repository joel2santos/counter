import 'package:bloc/bloc.dart';
import 'package:counter/domain/enum/counter.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterPressed>(_counterPressed);
  }

  void _counterPressed(
    CounterPressed event,
    Emitter<CounterState> emit,
  ) {
    final Counter counterType = event.counterType ?? state.counterType;
    final int counterValue = event.counterValue ?? 0;

    if (counterType.isIncrement) {
      emit(state.copyWith(counter: state.counter + counterValue));
    } else if (counterType.isDecrease) {
      emit(state.copyWith(counter: state.counter - counterValue));
    } else if (counterType.isReset) {
      emit(state.copyWith(counter: 0));
    }
  }
}
