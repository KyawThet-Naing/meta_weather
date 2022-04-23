import 'package:meta_weather/data/models/city_model.dart';
import 'package:meta_weather/data/models/weather_model.dart';
import 'package:meta_weather/utils/const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'weather_api_service.g.dart';

@RestApi(baseUrl: Const.apiUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) => _WeatherApiService(dio);

  @GET('location/search/')
  Future<List<CityModel>> searchCity({
    @Query("query") required String city,
    @DioOptions() required Options options,
  });

  @GET('location/{woeId}')
  Future<WeatherModel> weatherInfo({
    @Path('woeId') required String woeId,
    @DioOptions() required Options options,
  });
}
