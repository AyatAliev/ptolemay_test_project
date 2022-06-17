import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/core/usecases/usecase.dart';
import 'package:ptolemay_test_project/features/data/model/movie_model.dart';
import 'package:ptolemay_test_project/features/domain/repositories/home_repository.dart';

class GetPopularUseCase extends UseCase<MovieModel> {
  final HomeRepository _homeRepository;

  GetPopularUseCase(HomeRepository homeRepository) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, MovieModel>> execute() async {
    return await _homeRepository.getPopular();
  }
}
