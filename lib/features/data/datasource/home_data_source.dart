import 'package:ptolemay_test_project/features/data/model/weather.dart';

abstract class HomeDataSource {
  Future<WeatherMain> getWeather(double lat, double lon);
}
