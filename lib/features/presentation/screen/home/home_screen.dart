import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ptolemay_test_project/core/ui/custom_icons.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_dark_mode_usecase.dart';
import 'package:ptolemay_test_project/features/domain/usecases/get_popular_usecase.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/home/home_bloc.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/theme/theme_bloc.dart';
import 'package:ptolemay_test_project/features/presentation/bloc/theme/theme_event.dart';
import 'package:ptolemay_test_project/features/presentation/widgets/circle_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<HomeBloc>(
          create: (_) {
            return HomeBloc(
              getWeatherUseCase: GetIt.I<GetWeatherUseCase>(),
              getDarkModeUseCase: GetIt.I<GetDarkModeUseCase>(),
            );
          },
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (BuildContext context, HomeState state) {
              if (state is GetCounterState) {
                _counter = state.counter;
              }
            },
            builder: (BuildContext context, HomeState state) {
              return Column(
                children: [
                  if (state is GetPopularSuccess)
                    Column(
                      children: [
                        Text(
                          "Weather for ${state.weatherMain.sys.country}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "${state.weatherMain.name}: ${state.weatherMain.main.temp}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  centerTitleCounter(),
                  displayBottomButton(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget centerTitleCounter() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget displayBottomButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CircleButtonWidget(
                    icon: CustomIcons.ic_more,
                    onTap: () => BlocProvider.of<HomeBloc>(context).add(GetMoviePopularEvent())),
                CircleButtonWidget(
                    icon: CustomIcons.ic_star, onTap: () => context.read<ThemeBloc>().add(ChangeThemeEvent())),
              ],
            ),
            Column(
              children: [
                CircleButtonWidget(
                    icon: CustomIcons.ic_save,
                    isInvisible: _counter == 10,
                    onTap: () => BlocProvider.of<HomeBloc>(context).add(PlusEvent())),
                CircleButtonWidget(
                    icon: CustomIcons.ic_back,
                    isInvisible: _counter == 0,
                    onTap: () => BlocProvider.of<HomeBloc>(context).add(MinusEvent())),
              ],
            )
          ],
        ),
      ],
    );
  }
}
