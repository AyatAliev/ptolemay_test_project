part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

@immutable
class PlusEvent extends HomeEvent { }

@immutable
class MinusEvent extends HomeEvent { }

@immutable
class ChangeDarModeEvent extends HomeEvent { }

@immutable
class GetMoviePopularEvent extends HomeEvent { }
