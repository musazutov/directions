import 'package:directions/features/route_info/domain/entities/weather.dart';
import 'package:equatable/equatable.dart';

class RouteStep extends Equatable {
  final String direction;
  final double latitude;
  final double longitude;
  Weather? weather;

  RouteStep({
    required this.direction,
    required this.latitude,
    required this.longitude,
  });

  void setWeather(Weather? weather) {
    this.weather = weather;
  }

  @override
  List<Object> get props => [direction, latitude, longitude];
}
