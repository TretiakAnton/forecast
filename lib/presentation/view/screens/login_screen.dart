import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/core/routing/app_router.dart';
import 'package:forecast/generated/locale_keys.g.dart';
import 'package:forecast/presentation/state_management/login_bloc/login_cubit.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginCompleted) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.router.replace(const HomeScreenRoute());
                });
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${LocaleKeys.log_in_with.tr()}: '),
                const SizedBox(
                  height: 20,
                ),
                SignInButton(
                  Buttons.google,
                  onPressed: () async {
                    await context.read<LoginCubit>().login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
