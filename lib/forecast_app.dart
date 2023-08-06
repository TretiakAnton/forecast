import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/core/routing/app_router.dart';

import 'presentation/state_management/login_bloc/login_cubit.dart';
import 'presentation/state_management/weather_bloc/weather_cubit.dart';

class ForecastApp extends StatefulWidget {
  const ForecastApp({Key? key}) : super(key: key);

  @override
  State<ForecastApp> createState() => _ForecastAppState();
}

class _ForecastAppState extends State<ForecastApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(create: (context) => WeatherCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
      ],
      child: const _MaterialForecastApp(),
    );
  }
}

final GlobalKey<ScaffoldMessengerState> materialAppKey =
    GlobalKey<ScaffoldMessengerState>();

class _MaterialForecastApp extends StatefulWidget {
  const _MaterialForecastApp({Key? key}) : super(key: key);

  @override
  State<_MaterialForecastApp> createState() => _MaterialForecastAppState();
}

class _MaterialForecastAppState extends State<_MaterialForecastApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: materialAppKey,
      theme: ThemeData(primaryColor: Colors.green),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
