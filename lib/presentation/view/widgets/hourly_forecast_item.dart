import 'package:flutter/material.dart';
import 'package:forecast/domain/model/hourly_weather_model.dart';

class HourlyForecastItem extends StatefulWidget {
  const HourlyForecastItem({
    required HourlyWeatherModel model,
    Key? key,
  }) : super(key: key);

  @override
  State<HourlyForecastItem> createState() => _HourlyForecastItemState();
}

class _HourlyForecastItemState extends State<HourlyForecastItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
