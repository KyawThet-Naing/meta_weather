import 'package:flutter/foundation.dart';
import 'package:meta_weather/data/models/weather_model.dart';
import 'package:meta_weather/data/weather_repository.dart';

class WeatherDetailNotifier extends ChangeNotifier {
  WeatherModel? weatherModel;
  late WeatherRepository _weatherRepository;
  late bool error;
  late bool loading;
  WeatherDetailNotifier() {
    error = false;
    loading = false;
    _weatherRepository = WeatherRepository();
  }

  getWeatherInfo({required String woeId}) async {
    try {
      loading = true;
      notifyListeners();
      weatherModel = await _weatherRepository.weatherInfo(woeId: woeId);
      loading = false;
      notifyListeners();
    } catch (e) {
      error = true;
      loading = false;
      notifyListeners();
    }
  }
}
