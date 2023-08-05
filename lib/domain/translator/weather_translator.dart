import 'package:forecast/data/entity/weather_request.dart';
import 'package:forecast/data/entity/weather_response.dart';
import 'package:forecast/domain/model/daily_weather_model.dart';
import 'package:forecast/domain/model/hourly_weather_model.dart';

class WeatherTranslator {
  WeatherRequest createWeatherRequest({
    required double lat,
    required double lon,
  }) {
    return WeatherRequest(lat: lat, lon: lon);
  }

  List<DailyWeatherModel> weatherResponseToDailyForecast(
      {required WeatherResponse forecast}) {
    final List<DailyWeatherModel> result = [];
    for (Daily element in forecast.daily!) {
      result.add(DailyWeatherModel(
        sunrise: element.sunrise!.toDouble(),
        sunset: element.sunset!.toDouble(),
        temp: element.temp,
        weather: element.weather,
        windSpeed: element.windSpeed!.toDouble(),
      ));
    }
    return result;
  }

  List<HourlyWeatherModel> weatherResponseToHourlyForecast(
      {required WeatherResponse forecast}) {
    final List<HourlyWeatherModel> result = [];
    for (Hourly element in forecast.hourly!) {
      result.add(HourlyWeatherModel(
        temperature: element.temp!.toDouble(),
        feelsLike: element.feelsLike!.toDouble(),
        windSpeed: element.windSpeed!.toDouble(),
        weather: element.weather,
      ));
    }
    return result;
  }
}
