import 'package:get_it/get_it.dart';
import 'package:ptolemay_test_project/features/data/datasource/home_data_source.dart';
import 'package:ptolemay_test_project/features/data/datasource/impl/home_data_source_impl.dart';
import 'package:ptolemay_test_project/features/data/repositories/home_repository_impl.dart';
import 'package:ptolemay_test_project/features/data/repositories/theme_repository_impl.dart';
import 'package:ptolemay_test_project/features/domain/repositories/home_repository.dart';
import 'package:ptolemay_test_project/features/domain/repositories/theme_repository.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_dark_mode_usecase.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_popular_usecase.dart';
import 'package:ptolemay_test_project/features/domain/usecases/set_dark_mode_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/remote/dio_client.dart';

Future<void> di() async {
  await common();
  await theme();
  await home();
}

Future<void> common() async {
  GetIt.I.registerSingleton<DioClient>(DioClient());

  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}

Future<void> home() async {
  /// data source
  GetIt.I.registerSingleton<HomeDataSource>(
    HomeDataSourceImpl(dioClient: GetIt.I<DioClient>()),
  );

  /// repository
  GetIt.I.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(dataSource: GetIt.I<HomeDataSource>()),
  );

  /// use case
  GetIt.I.registerSingleton<GetWeatherUseCase>(
    GetWeatherUseCase(GetIt.I<HomeRepository>()),
  );
}

Future<void> theme() async {
  /// repository
  GetIt.I.registerSingleton<ThemeRepository>(
    ThemeRepositoryImpl(GetIt.I<SharedPreferences>()),
  );

  /// use case
  GetIt.I.registerSingleton<GetDarkModeUseCase>(
    GetDarkModeUseCase(GetIt.I<ThemeRepository>()),
  );

  GetIt.I.registerSingleton<SetDarkModeUseCase>(
    SetDarkModeUseCase(GetIt.I<ThemeRepository>()),
  );
}
