import 'package:flutter/material.dart';
import 'package:meta_weather/data/models/city_model.dart';
import 'package:meta_weather/view/change_notifier/weather_detail_notifier.dart';
import 'package:meta_weather/view/screen/city_detail.dart';
import 'package:provider/provider.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  const CityCard({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<WeatherDetailNotifier>(context, listen: false)
            .getWeatherInfo(woeId: '${city.woeid}');
        Navigator.pushNamed(context, CityDetail.route, arguments: city);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        alignment: Alignment.center,
        child: Text('${city.title}'),
      ),
    );
  }
}
