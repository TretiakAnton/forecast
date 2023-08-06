import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forecast/domain/model/daily_weather_model.dart';
import 'package:forecast/generated/locale_keys.g.dart';

class DailyForecastItem extends StatefulWidget {
  const DailyForecastItem({
    Key? key,
    required this.model,
    required this.count,
  }) : super(key: key);
  final DailyWeatherModel model;
  final int count;

  @override
  State<DailyForecastItem> createState() => _DailyForecastItemState();
}

class _DailyForecastItemState extends State<DailyForecastItem> {
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
                  Text('${LocaleKeys.day.tr()}: '),
                  Text(_nameOfDay(widget.count)),
                  const Spacer(),
                  Text('${widget.model.temp!.day}°C'),
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
                    LocaleKeys.min.tr(),
                    '${widget.model.temp!.min}°C',
                  ),
                  _detailsWidget(
                    LocaleKeys.max.tr(),
                    '${widget.model.temp!.max}°C',
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

  String _nameOfDay(int count) {
    DateTime today = DateTime.now();
    if (count == 0) {
      return LocaleKeys.today.tr();
    } else if (count == 1) {
      return LocaleKeys.tomorrow.tr();
    } else {
      DateTime futureDate = today.add(Duration(days: count));
      return DateFormat('dd/MM').format(futureDate);
    }
  }
}
