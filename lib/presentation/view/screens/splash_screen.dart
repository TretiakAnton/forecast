import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forecast/core/routing/app_router.dart';
import 'package:forecast/generated/assets.gen.dart';
import 'package:forecast/generated/locale_keys.g.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _goToNextScreen(context));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.forecast.tr(),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(Assets.png.forecast.path),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      context.router.replace(const LoginScreenRoute());
    }
  }
}
