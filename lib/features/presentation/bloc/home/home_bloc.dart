import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/features/data/model/weather.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_dark_mode_usecase.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_popular_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetWeatherUseCase getWeatherUseCase,
    required GetDarkModeUseCase getDarkModeUseCase,
  })  : _getWeatherUseCase = getWeatherUseCase,
        _getDarkModeUseCase = getDarkModeUseCase,
        super(HomeInitialState());

  final GetWeatherUseCase _getWeatherUseCase;
  final GetDarkModeUseCase _getDarkModeUseCase;
  int _counter = 0;
  int _value = 1;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is PlusEvent) {
      replaceCount();
      yield* _mapPlusEventToState();
    } else if (event is MinusEvent) {
      replaceCount();
      yield* _mapMinusEventToState();
    } else if (event is GetMoviePopularEvent) {
      yield* _mapGetMoviePopularEventToState();
    }
  }

  Stream<HomeState> _mapPlusEventToState() async* {
    if (_counter < 10) {
      _counter += _value;
      resetCounter();
      yield GetCounterState(counter: _counter);
    } else {
      yield CounterMaxValueState();
    }
  }

  Stream<HomeState> _mapMinusEventToState() async* {
    if (_counter > 0) {
      _counter -= _value;
      resetCounter();
      yield GetCounterState(counter: _counter);
    } else {
      yield CounterMinValueState();
    }
  }

  Stream<HomeState> _mapGetMoviePopularEventToState() async* {
    if (state is GetPopularLoading) return;

    yield GetPopularLoading();

    final position = await _getUserLocation();

    final failureOrGetPopular = await _getWeatherUseCase.execute(
      lat: position?.latitude ?? 42.882004,
      lon: position?.longitude ?? 74.582748,
    );

    yield failureOrGetPopular.fold(
        (error) => GetPopularError(
              statusCode: (error as ServerFailure).statusCode,
              statusMessage: (error).statusMessage,
            ),
        (movie) => GetPopularSuccess(movie));
  }

  Future<LocationData?> _getUserLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    final locationData = await location.getLocation();
    return locationData;
  }

  Future<void> replaceCount() async {
    (await _getDarkModeUseCase.execute()).fold((l) => {}, (r) {
      if (r) {
        _value = 2;
      } else {
        _value = 1;
      }
    });
  }

  void resetCounter() {
    if (_counter < 0) {
      _counter = 0;
    }
  }
}