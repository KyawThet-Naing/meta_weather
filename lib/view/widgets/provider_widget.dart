import 'package:meta_weather/view/change_notifier/city_search_notifier.dart';
import 'package:meta_weather/view/change_notifier/weather_detail_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderWidget extends StatelessWidget {
  final Widget child;

  const ProviderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CitySearchNotifier()),
        ChangeNotifierProvider(create: (ctx) => WeatherDetailNotifier()),
      ],
      child: child,
    );
  }
}
