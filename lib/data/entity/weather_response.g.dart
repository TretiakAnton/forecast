// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherResponseAdapter extends TypeAdapter<WeatherResponse> {
  @override
  final int typeId = 0;

  @override
  WeatherResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherResponse(
      lat: fields[0] as num?,
      lon: fields[1] as num?,
      timezone: fields[2] as String?,
      timezoneOffset: fields[3] as num?,
      current: fields[4] as Current?,
      hourly: (fields[5] as List?)?.cast<Hourly>(),
      daily: (fields[6] as List?)?.cast<Daily>(),
      alerts: (fields[7] as List?)?.cast<Alerts>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherResponse obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.timezoneOffset)
      ..writeByte(4)
      ..write(obj.current)
      ..writeByte(5)
      ..write(obj.hourly)
      ..writeByte(6)
      ..write(obj.daily)
      ..writeByte(7)
      ..write(obj.alerts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertsAdapter extends TypeAdapter<Alerts> {
  @override
  final int typeId = 1;

  @override
  Alerts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alerts(
      senderName: fields[0] as String?,
      event: fields[1] as String?,
      start: fields[2] as num?,
      end: fields[3] as num?,
      description: fields[4] as String?,
      tags: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Alerts obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.senderName)
      ..writeByte(1)
      ..write(obj.event)
      ..writeByte(2)
      ..write(obj.start)
      ..writeByte(3)
      ..write(obj.end)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyAdapter extends TypeAdapter<Daily> {
  @override
  final int typeId = 2;

  @override
  Daily read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Daily(
      dt: fields[0] as num?,
      sunrise: fields[1] as num?,
      sunset: fields[2] as num?,
      moonrise: fields[3] as num?,
      moonset: fields[4] as num?,
      moonPhase: fields[5] as num?,
      summary: fields[6] as String?,
      temp: fields[7] as Temp?,
      feelsLike: fields[8] as FeelsLike?,
      pressure: fields[9] as num?,
      humidity: fields[10] as num?,
      dewPoint: fields[11] as num?,
      windSpeed: fields[12] as num?,
      windDeg: fields[13] as num?,
      windGust: fields[14] as num?,
      weather: (fields[15] as List?)?.cast<Weather>(),
      clouds: fields[16] as num?,
      pop: fields[17] as num?,
      rain: fields[18] as num?,
      uvi: fields[19] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Daily obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.moonrise)
      ..writeByte(4)
      ..write(obj.moonset)
      ..writeByte(5)
      ..write(obj.moonPhase)
      ..writeByte(6)
      ..write(obj.summary)
      ..writeByte(7)
      ..write(obj.temp)
      ..writeByte(8)
      ..write(obj.feelsLike)
      ..writeByte(9)
      ..write(obj.pressure)
      ..writeByte(10)
      ..write(obj.humidity)
      ..writeByte(11)
      ..write(obj.dewPoint)
      ..writeByte(12)
      ..write(obj.windSpeed)
      ..writeByte(13)
      ..write(obj.windDeg)
      ..writeByte(14)
      ..write(obj.windGust)
      ..writeByte(15)
      ..write(obj.weather)
      ..writeByte(16)
      ..write(obj.clouds)
      ..writeByte(17)
      ..write(obj.pop)
      ..writeByte(18)
      ..write(obj.rain)
      ..writeByte(19)
      ..write(obj.uvi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 3;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      id: fields[0] as num?,
      main: fields[1] as String?,
      description: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeelsLikeAdapter extends TypeAdapter<FeelsLike> {
  @override
  final int typeId = 4;

  @override
  FeelsLike read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeelsLike(
      day: fields[0] as num?,
      night: fields[1] as num?,
      eve: fields[2] as num?,
      morn: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, FeelsLike obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.night)
      ..writeByte(2)
      ..write(obj.eve)
      ..writeByte(3)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeelsLikeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TempAdapter extends TypeAdapter<Temp> {
  @override
  final int typeId = 5;

  @override
  Temp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Temp(
      day: fields[0] as num?,
      min: fields[1] as num?,
      max: fields[2] as num?,
      night: fields[3] as num?,
      eve: fields[4] as num?,
      morn: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Temp obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.night)
      ..writeByte(4)
      ..write(obj.eve)
      ..writeByte(5)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HourlyAdapter extends TypeAdapter<Hourly> {
  @override
  final int typeId = 6;

  @override
  Hourly read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hourly(
      dt: fields[0] as num?,
      temp: fields[1] as num?,
      feelsLike: fields[2] as num?,
      pressure: fields[3] as num?,
      humidity: fields[4] as num?,
      dewPoint: fields[5] as num?,
      uvi: fields[6] as num?,
      clouds: fields[7] as num?,
      visibility: fields[8] as num?,
      windSpeed: fields[9] as num?,
      windDeg: fields[10] as num?,
      windGust: fields[11] as num?,
      weather: (fields[12] as List?)?.cast<Weather>(),
      pop: fields[13] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Hourly obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.feelsLike)
      ..writeByte(3)
      ..write(obj.pressure)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.dewPoint)
      ..writeByte(6)
      ..write(obj.uvi)
      ..writeByte(7)
      ..write(obj.clouds)
      ..writeByte(8)
      ..write(obj.visibility)
      ..writeByte(9)
      ..write(obj.windSpeed)
      ..writeByte(10)
      ..write(obj.windDeg)
      ..writeByte(11)
      ..write(obj.windGust)
      ..writeByte(12)
      ..write(obj.weather)
      ..writeByte(13)
      ..write(obj.pop);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 7;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      dt: fields[0] as num?,
      sunrise: fields[1] as num?,
      sunset: fields[2] as num?,
      temp: fields[3] as num?,
      feelsLike: fields[4] as num?,
      pressure: fields[5] as num?,
      humidity: fields[6] as num?,
      dewPoint: fields[7] as num?,
      uvi: fields[8] as num?,
      clouds: fields[9] as num?,
      visibility: fields[10] as num?,
      windSpeed: fields[11] as num?,
      windDeg: fields[12] as num?,
      weather: (fields[13] as List?)?.cast<Weather>(),
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.feelsLike)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.dewPoint)
      ..writeByte(8)
      ..write(obj.uvi)
      ..writeByte(9)
      ..write(obj.clouds)
      ..writeByte(10)
      ..write(obj.visibility)
      ..writeByte(11)
      ..write(obj.windSpeed)
      ..writeByte(12)
      ..write(obj.windDeg)
      ..writeByte(13)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
