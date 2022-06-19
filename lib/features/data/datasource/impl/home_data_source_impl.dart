import 'package:dio/dio.dart';
import 'package:ptolemay_test_project/core/error/exception.dart';
import 'package:ptolemay_test_project/core/remote/api_endpoints.dart';
import 'package:ptolemay_test_project/core/remote/dio_client.dart';
import 'package:ptolemay_test_project/features/data/datasource/home_data_source.dart';
import 'package:ptolemay_test_project/features/data/model/weather.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final DioClient _dioClient;

  HomeDataSourceImpl({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  @override
  Future<WeatherMain> getWeather(double lat, double lon) async {
    try {
      Response response = await _dioClient.dio.get(ApiEndpoints.getWeather(lat, lon));
      return WeatherMain.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    }
  }
}
