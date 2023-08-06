import 'package:easy_localization/easy_localization.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:forecast/generated/assets.gen.dart';
import 'package:forecast/generated/locale_keys.g.dart';
import 'package:forecast/presentation/view/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(Assets.png.forecast.path),
      title: Text(
        LocaleKeys.forecast.tr(),
      ),
      //backgroundColor: Colors.grey.shade400,
      showLoader: false,
      // loadingText: Text("Loading..."),
      navigator: const HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
