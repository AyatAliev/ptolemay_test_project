import 'package:dartz/dartz.dart';
import 'package:ptolemay_test_project/core/error/failure.dart';
import 'package:ptolemay_test_project/core/usecases/usecase.dart';
import 'package:ptolemay_test_project/features/domain/repositories/theme_repository.dart';

class SetDarkModeUseCase extends UseCase<void> {
  final ThemeRepository _themeRepository;

  SetDarkModeUseCase(ThemeRepository themeRepository) : _themeRepository = themeRepository;

  @override
  Future<Either<LocalFailure, void>> execute({
    bool darkMode = false,
  }) async {
    try {
      return Right(_themeRepository.setDarkMode(darkMode));
    } catch (e) {
      return Left(LocalFailure(statusMessage: "Dark mode not save"));
    }
  }
}
