import '../../domain/entities/route_info.dart';

abstract class RouteInfoState {}

class RouteInfoInitial extends RouteInfoState {}

class RouteInfoLoading extends RouteInfoState {}

class RouteInfoLoaded extends RouteInfoState {
  final RouteInfo routeInfo;

  RouteInfoLoaded({required this.routeInfo});
}

class RouteInfoError extends RouteInfoState {
  final String message;

  RouteInfoError({required this.message});
}
