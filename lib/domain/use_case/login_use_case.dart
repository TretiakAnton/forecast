import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:forecast/data/entity/weather_response.dart';
import 'package:forecast/data/repository/login_repository.dart';
import 'package:forecast/data/repository/weather_repository.dart';
import 'package:forecast/domain/model/daily_weather_model.dart';
import 'package:forecast/domain/model/hourly_weather_model.dart';
import 'package:forecast/domain/translator/weather_translator.dart';
import 'package:forecast/presentation/state_management/login_bloc/login_cubit.dart';
import 'package:forecast/presentation/state_management/weather_bloc/weather_cubit.dart';
import 'package:geolocator/geolocator.dart';

class LoginUseCase {
  final LoginRepository _repository = LoginRepository();

  Future<LoginState> login() async {
    LoginState result = LoginInitial();
    final credential = await _repository.login();
    credential.fold(
      (l) => result = LoginFailed(l.toString()),
      (credential) => result = LoginCompleted(),
    );
    return result;
  }
}
