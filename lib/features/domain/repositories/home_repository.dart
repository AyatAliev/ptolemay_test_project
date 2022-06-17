import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/features/data/model/movie_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, MovieModel>> getPopular();
}