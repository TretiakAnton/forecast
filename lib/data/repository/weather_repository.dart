import 'package:dartz/dartz.dart';
import 'package:forecast/data/data_source/weather_data_source.dart';
import 'package:forecast/data/entity/weather_request.dart';
import 'package:forecast/data/entity/weather_response.dart';

class WeatherRepository {
  final WeatherDataSource _source = WeatherDataSource();

  Future<Either<Exception, WeatherResponse?>> getForecast({
    required WeatherRequest request,
    required bool isOnline,
  }) async {
    //try {
    final result =
        await _source.getForecast(request: request, isOnline: isOnline);
    return Right(result);
    /*} catch (e) {
      return Left(Exception(e.toString()));
    }*/
  }

  Future<Either<Exception, void>> fillCache(WeatherResponse forecast) async {
    try {
      final result = await _source.fillCache(forecast);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
