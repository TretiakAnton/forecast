import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:forecast/data/entity/weather_response.dart';
import 'package:forecast/data/repository/weather_repository.dart';
import 'package:forecast/domain/model/daily_weather_model.dart';
import 'package:forecast/domain/model/hourly_weather_model.dart';
import 'package:forecast/domain/translator/weather_translator.dart';
import 'package:forecast/presentation/state_management/weather_bloc/weather_cubit.dart';
import 'package:geolocator/geolocator.dart';

class WeatherUseCase {
  final WeatherRepository _repository = WeatherRepository();
  final WeatherTranslator _translator = WeatherTranslator();
  List<HourlyWeatherModel>? _hourlyForecast;
  List<DailyWeatherModel>? _dailyForecast;

  List<HourlyWeatherModel>? get hourlyForecast => _hourlyForecast;

  List<DailyWeatherModel>? get dailyForecast => _dailyForecast;

  Future<WeatherState> getForecast() async {
    bool isInternetAvailable = await _checkIsInternetConnected();
    Position? position;
    if (isInternetAvailable) {
      position = await _getPosition();
    }

    ///default lat lon for Kyiv
    return await _madeForecastRequest(
        lat: position?.latitude ?? 50.45,
        lon: position?.longitude ?? 30.52,
        isOnline: isInternetAvailable);
  }

  Future<bool> _checkIsInternetConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<Position?> _getPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<WeatherState> _madeForecastRequest({
    required double lat,
    required double lon,
    required bool isOnline,
  }) async {
    WeatherState result = ForecastInitial();
    final response = await _repository.getForecast(
      request: _translator.createWeatherRequest(lat: lat, lon: lon),
      isOnline: isOnline,
    );
    response.fold((failure) {
      return result = ForecastFailed(failure.toString());
    }, (forecast) async {
      if (forecast != null) {
        if (isOnline) {
          _fillCache(forecast);
        }
        _dailyForecast =
            _translator.weatherResponseToDailyForecast(forecast: forecast);
        _hourlyForecast =
            _translator.weatherResponseToHourlyForecast(forecast: forecast);
      }
      result = ForecastCompleted();
    });
    return result;
  }

  Future<void> _fillCache(WeatherResponse forecast) async {
    await _repository.fillCache(forecast);
  }
}
