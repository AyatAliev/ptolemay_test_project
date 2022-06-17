import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/exception.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/features/data/datasource/home_data_source.dart';
import 'package:ptolemay_test_project/features/data/model/movie_model.dart';
import 'package:ptolemay_test_project/features/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, MovieModel>> getPopular() async {
    try {
      final data = await dataSource.getPopular();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, success: e.success, statusMessage: e.statusMessage));
    }
  }
}
