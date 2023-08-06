import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/domain/use_case/login_use_case.dart';
import 'package:forecast/presentation/view/widgets/snackbar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginUseCase _useCase = LoginUseCase();

  Future<void> login() async {
    emit(LoginInProgress());
    LoginState resultState = await _useCase.login();
    if (resultState is LoginFailed) {
      OrdinarySnackbar().showSnackBar(label: resultState.error ?? 'Error');
    }
    emit(resultState);
    return;
  }
}
