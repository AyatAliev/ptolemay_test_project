import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/core/usecases/usecase.dart';
import 'package:ptolemay_test_project/features/domain/repositories/theme_repository.dart';

class GetDarkModeUseCase extends UseCase<bool> {
  final ThemeRepository _themeRepository;

  GetDarkModeUseCase(ThemeRepository themeRepository) : _themeRepository = themeRepository;

  @override
  Future<Either<Failure, bool>> execute() async {
    try {
      return Right(_themeRepository.getDarkMode());
    } catch (e) {
      return Left(LocalFailure(statusMessage: "Dark mode not get"));
    }
  }
}
