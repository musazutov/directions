import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failures.dart';
import '../entities/route_info.dart';
import '../repositories/route_info_repository.dart';

class GetRouteInfoUseCase {
  final RouteInfoRepository repository;

  GetRouteInfoUseCase(this.repository);

  Future<Either<Failure, RouteInfo>> call(Params params) async {
    return await repository.getRouteInfo(from: params.from, to: params.to);
  }
}

class Params extends Equatable {
  final String from;
  final String to;

  const Params({required this.from, required this.to});

  @override
  List<Object> get props => [from, to];
}
