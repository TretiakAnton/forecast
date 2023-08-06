// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "forecast": "Forecast",
  "no_forecast": "It is no forecast available",
  "daily": "Daily",
  "hourly": "Hourly",
  "day": "Day",
  "today": "Today",
  "tomorrow": "Tomorrow",
  "time": "Time",
  "min": "Min",
  "max": "Max",
  "wind_speed": "Wind speed",
  "feels_like": "Feels like",
  "log_in_with": "Log in with"
};
static const Map<String,dynamic> ru_RU = {
  "forecast": "Прогноз погоды",
  "no_forecast": "Нет доступного прогноза погоды",
  "daily": "Подевно",
  "hourly": "Почасово",
  "day": "День",
  "today": "Сегодня",
  "tomorrow": "Завтра",
  "time": "Время",
  "min": "Мин",
  "max": "Макс",
  "wind_speed": "Скорость ветра",
  "feels_like": "Ощущается как",
  "log_in_with": "Войти с помощью"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "ru_RU": ru_RU};
}
