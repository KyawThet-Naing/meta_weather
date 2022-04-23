class CityModel {
  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;

  CityModel({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  CityModel.fromJson(Map<String, dynamic> json) {
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
