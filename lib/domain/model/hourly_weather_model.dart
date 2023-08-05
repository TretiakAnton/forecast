import 'package:forecast/data/entity/weather_response.dart';

class HourlyWeatherModel {
  final double? temperature;
  final double? feelsLike;
  final double? windSpeed;
  final List<Weather>? weather;

  HourlyWeatherModel({
    required this.temperature,
    required this.feelsLike,
    required this.windSpeed,
    required this.weather,
  });
}
