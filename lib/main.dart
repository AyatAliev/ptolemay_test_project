import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ptolemay_test_project/core/constant/route_name.dart';
import 'package:ptolemay_test_project/core/ui/app_themes.dart';
import 'package:ptolemay_test_project/core/ui/fade_page_route_builder.dart';
import 'package:ptolemay_test_project/di.dart';
import 'package:ptolemay_test_project/features/domain/usecases/set_dark_mode_usecase.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/theme/theme_bloc.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/theme/theme_state.dart';
import 'package:ptolemay_test_project/features/presentation/screen/home/home_screen.dart';
import 'package:ptolemay_test_project/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return BlocProvider(
      create: (context) => ThemeBloc(
        GetIt.I<SetDarkModeUseCase>(),
      ),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            title: 'Ptolemay',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeMode == ThemeMode.dark ? AppThemes.darkTheme() : AppThemes.lightTheme(),
            home: const HomeScreen(),
            initialRoute: RouteName.home,
            onGenerateRoute: (RouteSettings settings) {
              final routes = Routes.getRoutes(settings);
              final WidgetBuilder? builder = routes[settings.name];
              return FadePageRouteBuilder(
                builder: builder!,
                settings: settings,
              );
            },
          );
        },
      ),
    );
  }
}
