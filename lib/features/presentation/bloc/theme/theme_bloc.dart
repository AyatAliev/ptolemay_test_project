import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test_project/features/domain/usecases/set_dark_mode_usecase.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/theme/theme_event.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(
    SetDarkModeUseCase setDarkModeUseCase,
  )   : _setDarkModeUseCase = setDarkModeUseCase,
        super(ThemeState(themeMode: ThemeMode.light));

  final SetDarkModeUseCase _setDarkModeUseCase;

  bool _isDarkMode = false;

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeThemeEvent) {
      yield ThemeState(themeMode: _isDarkMode ? ThemeMode.light : ThemeMode.dark);
      _isDarkMode = !_isDarkMode;
      _setDarkModeUseCase.execute(darkMode: _isDarkMode);
    }
  }
}
