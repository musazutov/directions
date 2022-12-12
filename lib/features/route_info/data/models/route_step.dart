import 'package:directions/features/route_info/data/models/weather.dart';
import 'package:directions/features/route_info/domain/entities/route_step.dart';
import 'package:directions/features/route_info/domain/entities/weather.dart';

class RouteStepModel extends RouteStep {
  RouteStepModel({
    required String direction,
    required double latitude,
    required double longitude,
  }) : super(direction: direction, latitude: latitude, longitude: longitude);

  factory RouteStepModel.fromJson(Map<String, dynamic> json) {
    return RouteStepModel(
      direction: json['direction'] ?? '',
      latitude: ((json['location']?['lat'] ?? 0) as num).toDouble(),
      longitude: ((json['location']?['lng'] ?? 0) as num).toDouble(),
    );
  }
}
