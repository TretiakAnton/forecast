import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/generated/locale_keys.g.dart';
import 'package:forecast/presentation/state_management/weather_bloc/weather_cubit.dart';

class PeriodDropdown extends StatefulWidget {
  const PeriodDropdown({Key? key}) : super(key: key);

  @override
  State<PeriodDropdown> createState() => _PeriodDropdownState();
}

class _PeriodDropdownState extends State<PeriodDropdown> {
  List<String> list = <String>[
    LocaleKeys.hourly.tr().toString(),
    LocaleKeys.daily.tr().toString(),
  ];
  String? dropdownValue;

  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          context.read<WeatherCubit>().changeForecastType(value);
        });
      },
      underline: const SizedBox(),
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
