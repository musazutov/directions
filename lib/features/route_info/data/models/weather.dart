import 'package:directions/features/route_info/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required String description,
    required double temperature,
  }) : super(description: description, temperature: temperature);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        description: json['description'] ?? '',
        temperature: (json['temperature'] as num).toDouble());
  }
}
