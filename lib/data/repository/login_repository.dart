import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forecast/data/data_source/login_data_source.dart';
import 'package:forecast/data/data_source/weather_data_source.dart';
import 'package:forecast/data/entity/weather_request.dart';
import 'package:forecast/data/entity/weather_response.dart';

class LoginRepository {
  final LoginDataSource _source = LoginDataSource();

  Future<Either<Exception, UserCredential>> login() async {
    try {
      final result = await _source.googleLogin();
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
