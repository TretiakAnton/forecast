import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/domain/model/daily_weather_model.dart';
import 'package:forecast/domain/model/hourly_weather_model.dart';
import 'package:forecast/domain/use_case/weather_use_case.dart';
import 'package:forecast/generated/locale_keys.g.dart';
import 'package:forecast/presentation/view/widgets/snackbar.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(ForecastInitial());

  final WeatherUseCase _useCase = WeatherUseCase();

  bool _isHourly = true;

  bool get isHourly => _isHourly;

  bool get forecastIsNotEmpty => (dailyForecast?.isNotEmpty ?? false);

  int get forecastLength =>
      isHourly ? hourlyForecast!.length : dailyForecast!.length;

  List? get forecast => isHourly ? hourlyForecast : dailyForecast;

  List<DailyWeatherModel>? get dailyForecast => _useCase.dailyForecast;

  List<HourlyWeatherModel>? get hourlyForecast => _useCase.hourlyForecast;

  Future<void> getForecast() async {
    emit(ForecastInProgress());
    WeatherState resultState = await _useCase.getForecast();
    if (resultState is ForecastFailed) {
      OrdinarySnackbar().showSnackBar(label: resultState.error ?? 'Error');
      resultState = ForecastCompleted();
    }
    emit(resultState);
    return;
  }

  void changeForecastType(String value) {
    _isHourly = value == LocaleKeys.hourly.tr();
    emit(ForecastCompleted());
  }
}
