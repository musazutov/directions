import 'package:directions/features/route_info/domain/entities/route_step.dart';
import 'package:equatable/equatable.dart';

class RouteInfo extends Equatable {
  final double distance;
  final int duration;
  final List<RouteStep> routeSteps;

  const RouteInfo(
      {required this.distance,
      required this.duration,
      required this.routeSteps});

  @override
  List<Object> get props => [distance, duration];
}
