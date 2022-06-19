import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/core/usecases/usecase.dart';
import 'package:ptolemay_test_project/features/data/model/weather.dart';
import 'package:ptolemay_test_project/features/domain/repositories/home_repository.dart';

class GetWeatherUseCase extends UseCase<WeatherMain> {
  final HomeRepository _homeRepository;

  GetWeatherUseCase(HomeRepository homeRepository) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, WeatherMain>> execute({
    double lat = 42.882004,
    double lon = 74.582748,
  }) async {
    return await _homeRepository.getWeather(lat, lon);
  }
}
