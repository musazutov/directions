import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/route_info.dart';

abstract class RouteInfoRepository {
  Future<Either<Failure, RouteInfo>> getRouteInfo(
      {required String from, required String to});
}
