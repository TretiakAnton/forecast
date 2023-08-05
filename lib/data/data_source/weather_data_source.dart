import 'dart:convert';

import 'package:forecast/core/constants.dart';
import 'package:forecast/data/data_source/box_manager.dart';
import 'package:forecast/data/entity/weather_request.dart';
import 'package:forecast/data/entity/weather_response.dart';
import 'package:http/http.dart' as http;

class WeatherDataSource {
  final String _baseUrl = 'https://api.openweathermap.org/data/3.0/onecall';
  final BoxManager _boxManager = BoxManager();

  Future<WeatherResponse?> getForecast({
    required WeatherRequest request,
    required bool isOnline,
  }) async {
    if (isOnline) {
      return await _fetchWeatherFromApi(request);
    } else {
      return _fetchWeatherFromMemory();
    }
  }

  Future<WeatherResponse> _fetchWeatherFromApi(WeatherRequest request) async {
    final url = Uri.parse(
        '$_baseUrl?lat=${request.lat}&lon=${request.lon}&exclude=minutely&units=metric&appid=$apiKey');
    final response = await http.get(url);
    return WeatherResponse.fromJson(jsonDecode(response.body));
  }

  WeatherResponse? _fetchWeatherFromMemory() {
    return _boxManager.getLastWeather();
  }

  Future<void> fillCache(WeatherResponse forecast) async {
    return await _boxManager.saveWeather(forecast);
  }
}
