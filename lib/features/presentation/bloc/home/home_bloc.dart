import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/features/data/model/movie_model.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_popular_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetPopularUseCase getPopularUseCase,
  })  : _getPopularUseCase = getPopularUseCase,
        super(HomeInitialState());

  final GetPopularUseCase _getPopularUseCase;
  int _counter = 0;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is PlusEvent) {
      yield* _mapPlusEventToState();
    } else if (event is MinusEvent) {
      yield* _mapMinusEventToState();
    } else if (event is GetMoviePopularEvent) {
      yield* _mapGetMoviePopularEventToState();
    }
  }

  Stream<HomeState> _mapPlusEventToState() async* {
    if (_counter < 10) {
      _counter++;
      yield GetCounterState(counter: _counter);
    } else {
      yield CounterMaxValueState();
    }
  }

  Stream<HomeState> _mapMinusEventToState() async* {
    if (_counter > 0) {
      _counter--;
      yield GetCounterState(counter: _counter);
    } else {
      yield CounterMinValueState();
    }
  }

  Stream<HomeState> _mapGetMoviePopularEventToState() async* {
    if (state is GetPopularLoading) return;

    yield GetPopularLoading();

    final failureOrGetPopular = await _getPopularUseCase.execute();

    yield failureOrGetPopular.fold(
        (error) => GetPopularError(
              statusCode: (error as ServerFailure).statusCode,
              success: (error).success,
              statusMessage: (error).statusMessage,
            ),
        (movie) => GetPopularSuccess(movie));
  }
}
