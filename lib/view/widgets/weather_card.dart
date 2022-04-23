import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta_weather/data/models/weather_model.dart';
import 'package:meta_weather/view/widgets/image_view.dart';

class WeatherCard extends StatelessWidget {
  final ConsolidatedWeather weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat.MMMEd()
              .format(DateTime.parse(weather.applicableDate!))
              .toString(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 160,
          width: 120,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat.jm()
                    .format(DateTime.parse(weather.applicableDate!))
                    .toString(),
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ImageView(
                img: '${weather.weatherStateAbbr}',
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 10),
              Text(
                '${weather.theTemp?.toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(.3),
          ),
        ),
      ],
    );
  }
}
