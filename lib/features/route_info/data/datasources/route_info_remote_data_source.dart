import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:directions/features/route_info/data/models/weather.dart';
import 'package:directions/features/route_info/domain/entities/route_step.dart';
import 'package:flutter/material.dart';
import '../../../../core/failures.dart';
import '../../domain/entities/route_info.dart';
import '../models/route_info_model.dart';

abstract class RouteInfoRemoteDataSource {
  Future<Either<Failure, RouteInfo>> getRouteInfo(String from, String to);
}

class RouteInfoRemoteDataSourceImpl implements RouteInfoRemoteDataSource {
  final Dio client;

  RouteInfoRemoteDataSourceImpl({required this.client});

  Future<Either<Failure, RouteInfo>> _getRouteInfo(
      String from, String to) async {
    try {
      debugPrint('request is going');
      final response = await client.get('/route/$from/$to');
      debugPrint('response  is ready: ${response.data}');
      RouteInfoModel routeInfoModel = RouteInfoModel.fromJson(response.data);
      for (RouteStep routeStep in routeInfoModel.routeSteps) {
        routeStep.setWeather(
            await _getWeatherInfo(routeStep.latitude, routeStep.longitude));
      }
      return Right(routeInfoModel);
    } on DioError catch (error) {
      return Left(ServerFailure(error));
    } catch (e) {
      return Left(JsonParseFailure());
    }
  }

  @override
  Future<Either<Failure, RouteInfo>> getRouteInfo(String from, String to) =>
      _getRouteInfo(from, to);

  Future<WeatherModel?> _getWeatherInfo(
      double latitude, double longitude) async {
    try {
      debugPrint('request is going');
      final response = await client.get('/Weather/$latitude/$longitude');
      debugPrint('response  is ready: ${response.data}');
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
