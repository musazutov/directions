import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../../domain/entities/route_info.dart';
import '../../domain/repositories/route_info_repository.dart';
import '../datasources/route_info_remote_data_source.dart';

class RouteInfoRepositoryImpl implements RouteInfoRepository {
  final RouteInfoRemoteDataSource remoteDataSource;

  RouteInfoRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, RouteInfo>> getRouteInfo(
      {required String from, required String to}) async {
    return await remoteDataSource.getRouteInfo(from, to);
  }
}
