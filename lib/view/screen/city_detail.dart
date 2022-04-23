import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:meta_weather/data/models/city_model.dart';
import 'package:meta_weather/data/models/weather_model.dart';
import 'package:meta_weather/utils/const.dart';
import 'package:meta_weather/view/change_notifier/weather_detail_notifier.dart';
import 'package:meta_weather/view/widgets/image_view.dart';
import 'package:meta_weather/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/error_widget.dart';
import '../widgets/weather_card.dart';

class CityDetail extends StatelessWidget {
  final CityModel city;
  static const String route = "/city-detail";
  const CityDetail({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          centerTitle: true,
          title: Text('${city.title}'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xff5C6BC0),
                  Color(0xff3949AB),
                  Color(0xff283593),
                ],
              ),
            ),
            child: Consumer<WeatherDetailNotifier>(
              builder: (ctx, info, child) {
                if (info.loading) {
                  return const LoadingWidget(topPadding: 0);
                } else if (info.error) {
                  return const ErrorWidget(topPadding: 0);
                } else {
                  WeatherModel? weather = info.weatherModel;
                  ConsolidatedWeather? today = weather?.consolidatedWeather?[0];
                  var weathers = weather?.consolidatedWeather ?? [];

                  ///remove today data
                  weathers.removeAt(0);
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 30),
                      text('${today?.applicableDate}', fontSize: 18),
                      const SizedBox(height: 10),
                      text('Max Temp:', fontSize: 18),
                      text('${today?.maxTemp?.toStringAsFixed(2)}'),
                      const SizedBox(height: 10),
                      text('Min Temp:', fontSize: 18),
                      text('${today?.minTemp?.toStringAsFixed(2)}'),
                      const SizedBox(height: 10),
                      text('Current Temp:', fontSize: 18),
                      text('${today?.theTemp?.toStringAsFixed(2)}'),
                      const SizedBox(height: 20),
                      ImageView(img: '${today?.weatherStateAbbr}'),
                      const SizedBox(height: 10),
                      text('${today?.weatherStateName}', fontSize: 28),
                      const SizedBox(height: 30),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              weathers.length,
                              (index) => WeatherCard(
                                weather: weathers[index],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
              },
            )));
  }

  Widget text(String text, {double fontSize = 16}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
    );
  }
}
