import 'package:directions/features/route_info/data/models/route_step.dart';
import '../../domain/entities/route_info.dart';

class RouteInfoModel extends RouteInfo {
  const RouteInfoModel(
      {required List<RouteStepModel> routeSteps,
      required int duration,
      required double distance})
      : super(distance: distance, duration: duration, routeSteps: routeSteps);

  factory RouteInfoModel.fromJson(Map<String, dynamic> json) {
    return RouteInfoModel(
        distance: ((json['distance'] ?? 0) as num).toDouble(),
        duration: ((json['duration'] ?? 0) as num).toInt(),
        routeSteps: json['steps'] != null
            ? (json['steps'] as List)
                .map((e) => RouteStepModel.fromJson(e))
                .toList()
            : []);
  }
}
