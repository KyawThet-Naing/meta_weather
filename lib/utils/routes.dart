import 'package:flutter/material.dart';
import 'package:meta_weather/data/models/city_model.dart';
import 'package:meta_weather/view/screen/city_detail.dart';
import '/view/screen/city_search.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CitySearch.route:
        return pageRoute(page: const CitySearch(), routeName: CitySearch.route);

      case CityDetail.route:
        var city = settings.arguments as CityModel;
        return pageRoute(
            page: CityDetail(city: city), routeName: CityDetail.route);

      default:
        return null;
    }
  }

  static pageRoute({required Widget page, required String routeName}) {
    return MaterialPageRoute(
      builder: (ctx) => page,
      settings: RouteSettings(name: routeName),
    );
  }
}
