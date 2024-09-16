import 'package:weather/model/main_model.dart';
import 'package:weather/model/sys_model.dart';
import 'package:weather/model/weather_data_model.dart';
import 'package:weather/model/wind_model.dart';

class WeatherModel {
  List<Weather>? weather;
  Main? main;
  Wind? wind;
  Sys? sys;
  String? name;
  int? cod;

  WeatherModel(
      {this.weather, this.main, this.wind, this.sys, this.name, this.cod});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
