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
    required this.success,
  });

  final int statusCode;
  final String statusMessage;
  final bool success;

  @override
  List<Object> get props => [statusMessage, statusCode, success];
}

/// Get Popular State

class GetPopularLoading extends HomeState {}

class GetPopularSuccess extends HomeState {
  GetPopularSuccess(this.popularModel);

  final MovieModel popularModel;

  @override
  List<Object> get props => [popularModel];
}

