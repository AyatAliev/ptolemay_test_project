import 'package:ptolemay_test_project/features/domain/repositories/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final SharedPreferences _sharedPreferences;
  static const String _darkMode = "darkMode";

  ThemeRepositoryImpl(
    SharedPreferences sharedPreferences,
  ) : _sharedPreferences = sharedPreferences;

  @override
  bool getDarkMode() {
    return _sharedPreferences.getBool(_darkMode) ?? false;
  }

  @override
  void setDarkMode(bool darkMode) async {
    try {
      await _sharedPreferences.setBool(_darkMode, darkMode);
    } catch (e) {
      rethrow;
    }
  }
}
