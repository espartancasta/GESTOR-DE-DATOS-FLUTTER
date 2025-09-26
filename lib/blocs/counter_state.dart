import 'package:equatable/equatable.dart';

enum CounterStatus { initial, normal, maxReached, minReached }

class CounterState extends Equatable {
  final int value;
  final CounterStatus status;

  const CounterState({required this.value, required this.status});

  factory CounterState.initial() => const CounterState(value: 0, status: CounterStatus.initial);

  CounterState copyWith({int? value, CounterStatus? status}) {
    return CounterState(
      value: value ?? this.value,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [value, status];
}
