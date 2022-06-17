import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> execute();
}
