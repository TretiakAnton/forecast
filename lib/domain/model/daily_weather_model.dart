import 'package:forecast/data/entity/weather_response.dart';

class DailyWeatherModel {
  final double? sunrise;
  final double? sunset;
  final Temp? temp;
  final List<Weather>? weather;
  final double? windSpeed;

  DailyWeatherModel({
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.weather,
    required this.windSpeed,
  });
}
