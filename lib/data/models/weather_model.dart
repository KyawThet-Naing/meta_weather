class WeatherModel {
  List<ConsolidatedWeather>? consolidatedWeather;
  String? time;
  String? sunRise;
  String? sunSet;
  String? timezoneName;
  Parent? parent;
  List<Sources>? sources;
  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;
  String? timezone;

  WeatherModel({
    this.consolidatedWeather,
    this.time,
    this.sunRise,
    this.sunSet,
    this.timezoneName,
    this.parent,
    this.sources,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    consolidatedWeather = (json['consolidated_weather'] as List?)
        ?.map((dynamic e) =>
            ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        .toList();
    time = json['time'] as String?;
    sunRise = json['sun_rise'] as String?;
    sunSet = json['sun_set'] as String?;
    timezoneName = json['timezone_name'] as String?;
    parent = (json['parent'] as Map<String, dynamic>?) != null
        ? Parent.fromJson(json['parent'] as Map<String, dynamic>)
        : null;
    sources = (json['sources'] as List?)
        ?.map((dynamic e) => Sources.fromJson(e as Map<String, dynamic>))
        .toList();
    title = json['title'] as String?;
    locationType = json['location_type'] as String?;
    woeid = json['woeid'] as int?;
    lattLong = json['latt_long'] as String?;
    timezone = json['timezone'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['consolidated_weather'] =
        consolidatedWeather?.map((e) => e.toJson()).toList();
    json['time'] = time;
    json['sun_rise'] = sunRise;
    json['sun_set'] = sunSet;
    json['timezone_name'] = timezoneName;
    json['parent'] = parent?.toJson();
    json['sources'] = sources?.map((e) => e.toJson()).toList();
    json['title'] = title;
    json['location_type'] = locationType;
    json['woeid'] = woeid;
    json['latt_long'] = lattLong;
    json['timezone'] = timezone;
    return json;
  }
}

class ConsolidatedWeather {
  int? id;
  String? weatherStateName;
  String? weatherStateAbbr;
  String? windDirectionCompass;
  String? created;
  String? applicableDate;
  double? minTemp;
  double? maxTemp;
  double? theTemp;
  double? windSpeed;
  double? windDirection;
  double? airPressure;
  int? humidity;
  double? visibility;
  int? predictability;

  ConsolidatedWeather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    weatherStateName = json['weather_state_name'] as String?;
    weatherStateAbbr = json['weather_state_abbr'] as String?;
    windDirectionCompass = json['wind_direction_compass'] as String?;
    created = json['created'] as String?;
    applicableDate = json['applicable_date'] as String?;
    minTemp = json['min_temp'] as double?;
    maxTemp = json['max_temp'] as double?;
    theTemp = json['the_temp'] as double?;
    windSpeed = json['wind_speed'] as double?;
    windDirection = json['wind_direction'] as double?;
    airPressure = json['air_pressure'] as double?;
    humidity = json['humidity'] as int?;
    visibility = json['visibility'] as double?;
    predictability = json['predictability'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['weather_state_name'] = weatherStateName;
    json['weather_state_abbr'] = weatherStateAbbr;
    json['wind_direction_compass'] = windDirectionCompass;
    json['created'] = created;
    json['applicable_date'] = applicableDate;
    json['min_temp'] = minTemp;
    json['max_temp'] = maxTemp;
    json['the_temp'] = theTemp;
    json['wind_speed'] = windSpeed;
    json['wind_direction'] = windDirection;
    json['air_pressure'] = airPressure;
    json['humidity'] = humidity;
    json['visibility'] = visibility;
    json['predictability'] = predictability;
    return json;
  }
}

class Parent {
  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;

  Parent({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  Parent.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    locationType = json['location_type'] as String?;
    woeid = json['woeid'] as int?;
    lattLong = json['latt_long'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['location_type'] = locationType;
    json['woeid'] = woeid;
    json['latt_long'] = lattLong;
    return json;
  }
}

class Sources {
  String? title;
  String? slug;
  String? url;
  int? crawlRate;

  Sources({
    this.title,
    this.slug,
    this.url,
    this.crawlRate,
  });

  Sources.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    slug = json['slug'] as String?;
    url = json['url'] as String?;
    crawlRate = json['crawl_rate'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['slug'] = slug;
    json['url'] = url;
    json['crawl_rate'] = crawlRate;
    return json;
  }
}
