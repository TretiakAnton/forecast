import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/generated/locale_keys.g.dart';
import 'package:forecast/presentation/state_management/weather_bloc/weather_cubit.dart';
import 'package:forecast/presentation/view/widgets/daily_forecast_item.dart';
import 'package:forecast/presentation/view/widgets/hourly_forecast_item.dart';
import 'package:forecast/presentation/view/widgets/period_dropdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const PeriodDropdown(),
        ),
        body: FutureBuilder(
          future: bloc.getForecast(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: bloc.forecastIsNotEmpty
                        ? ListView.builder(
                            itemCount: bloc.forecastLength,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: bloc.isHourly
                                    ? HourlyForecastItem(
                                        model: bloc.forecast![index],
                                        count: index,
                                      )
                                    : DailyForecastItem(
                                        model: bloc.forecast![index],
                                        count: index,
                                      ),
                              );
                            },
                          )
                        : Center(
                            child: Text(LocaleKeys.no_forecast.tr()),
                          ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
