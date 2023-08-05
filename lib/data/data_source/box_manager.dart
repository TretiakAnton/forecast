import 'package:forecast/data/entity/weather_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BoxManager {
  static final BoxManager _instance = BoxManager._internal();
  final String _lastWeatherKey = 'lastWeather';
  late Box _weatherBox;

  factory BoxManager() {
    return _instance;
  }

  BoxManager._internal();

  Future<void> init() async {
    _weatherBox = await Hive.openBox('weatherBox');
  }

  Future<void> saveWeather(WeatherResponse response) async {
    return await _weatherBox.put(_lastWeatherKey, response);
  }

  WeatherResponse? getLastWeather() {
    return _weatherBox.get(_lastWeatherKey);
  }
}
