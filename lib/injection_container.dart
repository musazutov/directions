import 'package:dio/dio.dart';
import 'package:directions/features/route_info/data/datasources/route_info_remote_data_source.dart';
import 'package:directions/features/route_info/domain/repositories/route_info_repository.dart';
import 'package:directions/features/route_info/domain/usecases/get_route.info.dart';
import 'package:directions/features/route_info/presentation/bloc/route_info_cubit.dart';
import 'package:get_it/get_it.dart';
import 'features/route_info/data/repositories/route_info_repository_impl.dart';

final sl = GetIt.instance;
// addded from develop branch qweqw
Future<void> initDI() async {
  /// Bloc
  sl.registerFactory(() => RouteInfoCubit(sl()));

  /// Use cases
  sl.registerLazySingleton(() => GetRouteInfoUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<RouteInfoRepository>(
    () => RouteInfoRepositoryImpl(remoteDataSource: sl()),
  );

  /// Data sources
  sl.registerLazySingleton<RouteInfoRemoteDataSource>(
    () => RouteInfoRemoteDataSourceImpl(client: sl()),
  );

  /// Core
  sl.registerLazySingleton(() =>
      Dio(BaseOptions(baseUrl: 'https://scrmobiletest.azurewebsites.net/api')));
}
