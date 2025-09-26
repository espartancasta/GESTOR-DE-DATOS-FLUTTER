import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final int maxValue;
  final int minValue;

  CounterBloc({this.maxValue = 10, this.minValue = -10}) : super(CounterState.initial()) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
    on<ResetEvent>(_onReset);
  }

  void _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    final newValue = state.value + 1;
    if (newValue >= maxValue) {
      emit(state.copyWith(value: maxValue, status: CounterStatus.maxReached));
    } else {
      emit(state.copyWith(value: newValue, status: CounterStatus.normal));
    }
  }

  void _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    final newValue = state.value - 1;
    if (newValue <= minValue) {
      emit(state.copyWith(value: minValue, status: CounterStatus.minReached));
    } else {
      emit(state.copyWith(value: newValue, status: CounterStatus.normal));
    }
  }

  void _onReset(ResetEvent event, Emitter<CounterState> emit) {
    emit(CounterState.initial());
  }
}
