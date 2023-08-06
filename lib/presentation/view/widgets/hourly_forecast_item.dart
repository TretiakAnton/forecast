import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forecast/domain/model/hourly_weather_model.dart';
import 'package:forecast/generated/locale_keys.g.dart';

class HourlyForecastItem extends StatefulWidget {
  const HourlyForecastItem({
    required this.model,
    required this.count,
    Key? key,
  }) : super(key: key);
  final int count;
  final HourlyWeatherModel model;

  @override
  State<HourlyForecastItem> createState() => _HourlyForecastItemState();
}

class _HourlyForecastItemState extends State<HourlyForecastItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text('${LocaleKeys.time.tr()}: '),
                  Text(_calculateTime(widget.count)),
                  const Spacer(),
                  Text('${widget.model.temperature}°C'),
                ],
              ),
            ),
            Visibility(
              visible: isExpanded,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  _detailsWidget(
                    LocaleKeys.feels_like.tr(),
                    '${widget.model.feelsLike}°C',
                  ),
                  _detailsWidget(
                    LocaleKeys.wind_speed.tr(),
                    widget.model.windSpeed.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsWidget(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(value),
        ],
      ),
    );
  }

  String _calculateTime(int count) {
    final now = DateTime.now();
    final formatted = now.add(Duration(hours: count));
    if (formatted.day == now.day) {
      return '${formatted.hour}:00';
    } else if (formatted.day == now.day + 1) {
      return '${LocaleKeys.tomorrow.tr()} ${formatted.hour}:00';
    } else {
      return '${DateFormat('dd/MM').format(formatted)} ${formatted.hour}:00';
    }
  }
}
