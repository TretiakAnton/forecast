import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:forecast/generated/codegen_loader.g.dart';

class LocalizationWidget extends StatelessWidget {
  final Widget widget;

  const LocalizationWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
      saveLocale: true,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'Ru'),
      ],
      child: widget,
    );
  }
}
