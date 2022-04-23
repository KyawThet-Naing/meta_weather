import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:meta_weather/data/api_service/weather_api_service.dart';
import 'package:meta_weather/data/models/weather_model.dart';
import 'package:meta_weather/data/models/city_model.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  late Dio _dio;
  late WeatherApiService _weatherApiService;
  final Options _options = buildCacheOptions(
    const Duration(days: 1),
    forceRefresh: true,
  );
  WeatherRepository() {
    _dio = Dio();
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        // ignore: avoid_print
        logPrint: (_) => print(_),
      ),
    );

    _dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);

    _weatherApiService = WeatherApiService(_dio);
  }

  Future<List<CityModel>> searchCity({required String city}) {
    return _weatherApiService.searchCity(city: city, options: _options);
  }

  Future<WeatherModel> weatherInfo({required String woeId}) {
    return _weatherApiService.weatherInfo(woeId: woeId, options: _options);
  }
}
