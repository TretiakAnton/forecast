import 'package:hive_flutter/hive_flutter.dart';

part 'weather_response.g.dart';

@HiveType(typeId: 0)
class WeatherResponse extends HiveObject {
  @HiveField(0)
  num? lat;

  @HiveField(1)
  num? lon;

  @HiveField(2)
  String? timezone;

  @HiveField(3)
  num? timezoneOffset;

  @HiveField(4)
  Current? current;

  @HiveField(5)
  List<Hourly>? hourly;

  @HiveField(6)
  List<Daily>? daily;

  @HiveField(7)
  List<Alerts>? alerts;

  WeatherResponse({
    num? lat,
    num? lon,
    String? timezone,
    num? timezoneOffset,
    Current? current,
    List<Hourly>? hourly,
    List<Daily>? daily,
    List<Alerts>? alerts,
  }) {
    lat = lat;
    lon = lon;
    timezone = timezone;
    timezoneOffset = timezoneOffset;
    current = current;
    hourly = hourly;
    daily = daily;
    alerts = alerts;
  }

  WeatherResponse.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = [];
      json['hourly'].forEach((v) {
        hourly?.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily?.add(Daily.fromJson(v));
      });
    }
    if (json['alerts'] != null) {
      alerts = [];
      json['alerts'].forEach((v) {
        alerts?.add(Alerts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lat'] = lat;
    data['lon'] = lon;
    data['timezone'] = timezone;
    data['timezone_offset'] = timezoneOffset;
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.map((v) => v.toJson()).toList();
    }
    if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
    }
    if (alerts != null) {
      data['alerts'] = alerts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Alerts extends HiveObject {
  @HiveField(0)
  String? senderName;

  @HiveField(1)
  String? event;

  @HiveField(2)
  num? start;

  @HiveField(3)
  num? end;

  @HiveField(4)
  String? description;

  @HiveField(5)
  List<String>? tags;

  Alerts({
    String? senderName,
    String? event,
    num? start,
    num? end,
    String? description,
    List<String>? tags,
  }) {
    senderName = senderName;
    event = event;
    start = start;
    end = end;
    description = description;
    tags = tags;
  }

  Alerts.fromJson(dynamic json) {
    senderName = json['sender_name'];
    event = json['event'];
    start = json['start'];
    end = json['end'];
    description = json['description'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender_name'] = senderName;
    map['event'] = event;
    map['start'] = start;
    map['end'] = end;
    map['description'] = description;
    map['tags'] = tags;
    return map;
  }
}

@HiveType(typeId: 2)
class Daily extends HiveObject {
  @HiveField(0)
  num? dt;

  @HiveField(1)
  num? sunrise;

  @HiveField(2)
  num? sunset;

  @HiveField(3)
  num? moonrise;

  @HiveField(4)
  num? moonset;

  @HiveField(5)
  num? moonPhase;

  @HiveField(6)
  String? summary;

  @HiveField(7)
  Temp? temp;

  @HiveField(8)
  FeelsLike? feelsLike;

  @HiveField(9)
  num? pressure;

  @HiveField(10)
  num? humidity;

  @HiveField(11)
  num? dewPoint;

  @HiveField(12)
  num? windSpeed;

  @HiveField(13)
  num? windDeg;

  @HiveField(14)
  num? windGust;

  @HiveField(15)
  List<Weather>? weather;

  @HiveField(16)
  num? clouds;

  @HiveField(17)
  num? pop;

  @HiveField(18)
  num? rain;

  @HiveField(19)
  num? uvi;

  Daily({
    num? dt,
    num? sunrise,
    num? sunset,
    num? moonrise,
    num? moonset,
    num? moonPhase,
    String? summary,
    Temp? temp,
    FeelsLike? feelsLike,
    num? pressure,
    num? humidity,
    num? dewPoint,
    num? windSpeed,
    num? windDeg,
    num? windGust,
    List<Weather>? weather,
    num? clouds,
    num? pop,
    num? rain,
    num? uvi,
  }) {
    dt = dt;
    sunrise = sunrise;
    sunset = sunset;
    moonrise = moonrise;
    moonset = moonset;
    moonPhase = moonPhase;
    summary = summary;
    temp = temp;
    feelsLike = feelsLike;
    pressure = pressure;
    humidity = humidity;
    dewPoint = dewPoint;
    windSpeed = windSpeed;
    windDeg = windDeg;
    windGust = windGust;
    weather = weather;
    clouds = clouds;
    pop = pop;
    rain = rain;
    uvi = uvi;
  }

  Daily.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    summary = json['summary'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    pop = json['pop'];
    rain = json['rain'];
    uvi = double.parse(json['uvi'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['summary'] = summary;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    if (feelsLike != null) {
      data['feels_like'] = feelsLike!.toJson();
    }
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    data['uvi'] = uvi;
    return data;
  }
}

@HiveType(typeId: 3)
class Weather extends HiveObject {
  @HiveField(0)
  num? id;

  @HiveField(1)
  String? main;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? icon;

  Weather({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) {
    id = id;
    main = main;
    description = description;
    icon = icon;
  }

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

@HiveType(typeId: 4)
class FeelsLike extends HiveObject {
  @HiveField(0)
  num? day;

  @HiveField(1)
  num? night;

  @HiveField(2)
  num? eve;

  @HiveField(3)
  num? morn;

  FeelsLike({
    num? day,
    num? night,
    num? eve,
    num? morn,
  }) {
    day = day;
    night = night;
    eve = eve;
    morn = morn;
  }

  FeelsLike.fromJson(dynamic json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

@HiveType(typeId: 5)
class Temp extends HiveObject {
  @HiveField(0)
  num? day;

  @HiveField(1)
  num? min;

  @HiveField(2)
  num? max;

  @HiveField(3)
  num? night;

  @HiveField(4)
  num? eve;

  @HiveField(5)
  num? morn;

  Temp({
    num? day,
    num? min,
    num? max,
    num? night,
    num? eve,
    num? morn,
  }) {
    day = day;
    min = min;
    max = max;
    night = night;
    eve = eve;
    morn = morn;
  }

  Temp.fromJson(dynamic json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['min'] = min;
    map['max'] = max;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

@HiveType(typeId: 6)
class Hourly extends HiveObject {
  @HiveField(0)
  num? dt;

  @HiveField(1)
  num? temp;

  @HiveField(2)
  num? feelsLike;

  @HiveField(3)
  num? pressure;

  @HiveField(4)
  num? humidity;

  @HiveField(5)
  num? dewPoint;

  @HiveField(6)
  num? uvi;

  @HiveField(7)
  num? clouds;

  @HiveField(8)
  num? visibility;

  @HiveField(9)
  num? windSpeed;

  @HiveField(10)
  num? windDeg;

  @HiveField(11)
  num? windGust;

  @HiveField(12)
  List<Weather>? weather;

  @HiveField(13)
  num? pop;

  Hourly({
    num? dt,
    num? temp,
    num? feelsLike,
    num? pressure,
    num? humidity,
    num? dewPoint,
    num? uvi,
    num? clouds,
    num? visibility,
    num? windSpeed,
    num? windDeg,
    num? windGust,
    List<Weather>? weather,
    num? pop,
  }) {
    dt = dt;
    temp = temp;
    feelsLike = feelsLike;
    pressure = pressure;
    humidity = humidity;
    dewPoint = dewPoint;
    uvi = uvi;
    clouds = clouds;
    visibility = visibility;
    windSpeed = windSpeed;
    windDeg = windDeg;
    windGust = windGust;
    weather = weather;
    pop = pop;
  }

  Hourly.fromJson(dynamic json) {
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = double.parse(json['uvi'].toString());
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    pop = json['pop'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['uvi'] = uvi;
    map['clouds'] = clouds;
    map['visibility'] = visibility;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['pop'] = pop;
    return map;
  }
}

@HiveType(typeId: 7)
class Current extends HiveObject {
  @HiveField(0)
  num? dt;

  @HiveField(1)
  num? sunrise;

  @HiveField(2)
  num? sunset;

  @HiveField(3)
  num? temp;

  @HiveField(4)
  num? feelsLike;

  @HiveField(5)
  num? pressure;

  @HiveField(6)
  num? humidity;

  @HiveField(7)
  num? dewPoint;

  @HiveField(8)
  num? uvi;

  @HiveField(9)
  num? clouds;

  @HiveField(10)
  num? visibility;

  @HiveField(11)
  num? windSpeed;

  @HiveField(12)
  num? windDeg;

  @HiveField(13)
  List<Weather>? weather;

  Current({
    num? dt,
    num? sunrise,
    num? sunset,
    num? temp,
    num? feelsLike,
    num? pressure,
    num? humidity,
    num? dewPoint,
    num? uvi,
    num? clouds,
    num? visibility,
    num? windSpeed,
    num? windDeg,
    List<Weather>? weather,
  }) {
    dt = dt;
    sunrise = sunrise;
    sunset = sunset;
    temp = temp;
    feelsLike = feelsLike;
    pressure = pressure;
    humidity = humidity;
    dewPoint = dewPoint;
    uvi = uvi;
    clouds = clouds;
    visibility = visibility;
    windSpeed = windSpeed;
    windDeg = windDeg;
    weather = weather;
  }

  Current.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = double.parse(json['uvi'].toString());
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['uvi'] = uvi;
    map['clouds'] = clouds;
    map['visibility'] = visibility;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
