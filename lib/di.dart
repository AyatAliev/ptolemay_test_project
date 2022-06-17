import 'package:get_it/get_it.dart';
import 'package:ptolemay_test_project/features/data/datasource/home_data_source.dart';
import 'package:ptolemay_test_project/features/data/datasource/impl/home_data_source_impl.dart';
import 'package:ptolemay_test_project/features/data/repositories/home_repository_impl.dart';
import 'package:ptolemay_test_project/features/domain/repositories/home_repository.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_popular_usecase.dart';

import 'core/remote/dio_client.dart';

Future<void> di() async {
  await common();
  await home();
}

Future<void> common() async {
  GetIt.I.registerSingleton<DioClient>(DioClient());
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
  GetIt.I.registerSingleton<GetPopularUseCase>(
    GetPopularUseCase(GetIt.I<HomeRepository>()),
  );
}
