part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomeInitialState extends HomeState {}

@immutable
class GetCounterState extends HomeState {
  GetCounterState({required this.counter});

  final int counter;

  @override
  List<Object> get props => [counter];
}

@immutable
class CounterMaxValueState extends HomeState {}

@immutable
class CounterMinValueState extends HomeState {}

class GetPopularError extends HomeState {
  GetPopularError({
    required this.statusCode,
    required this.statusMessage,
  });

  final int statusCode;
  final String statusMessage;

  @override
  List<Object> get props => [statusMessage, statusCode];
}

/// Get Popular State

class GetPopularLoading extends HomeState {}

class GetPopularSuccess extends HomeState {
  GetPopularSuccess(this.weatherMain);

  final WeatherMain weatherMain;

  @override
  List<Object> get props => [weatherMain];
}

