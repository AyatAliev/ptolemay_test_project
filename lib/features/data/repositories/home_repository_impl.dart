import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/exception.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/features/data/datasource/home_data_source.dart';
import 'package:ptolemay_test_project/features/data/model/weather.dart';
import 'package:ptolemay_test_project/features/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, WeatherMain>> getWeather(double lat,double lon) async {
    try {
      final data = await dataSource.getWeather(lat, lon);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.cod, statusMessage: e.message));
    }
  }
}
