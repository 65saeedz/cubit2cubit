part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterNumber;
  const CounterState({required this.counterNumber});

  @override
  String toString() => 'CounterState(counterNumber: $counterNumber)';
  @override
  List<Object> get props => [counterNumber];
  CounterState copyWith(int? counterNumber) {
    return CounterState(counterNumber: counterNumber ?? this.counterNumber);
  }

  factory CounterState.initial() {
    return const CounterState(counterNumber: 0);
  }
}
