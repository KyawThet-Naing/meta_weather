import 'package:flutter/foundation.dart';
import 'package:meta_weather/data/models/city_model.dart';
import 'package:meta_weather/data/weather_repository.dart';

class CitySearchNotifier extends ChangeNotifier {
  late WeatherRepository _weatherRepository;
  late List<CityModel> cities;
  late bool loading;
  late bool error;

  CitySearchNotifier() {
    cities = [];
    error = false;
    loading = false;
    _weatherRepository = WeatherRepository();
  }

  void searchCity({required String city}) async {
    try {
      loading = true;
      notifyListeners();
      cities = await _weatherRepository.searchCity(city: city);
      loading = false;
      notifyListeners();
    } catch (_) {
      error = true;
      loading = false;
      notifyListeners();
    }
  }
}
