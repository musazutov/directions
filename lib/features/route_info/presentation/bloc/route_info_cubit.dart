import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/failures.dart';
import '../../domain/usecases/get_route.info.dart';
import 'route_info_state.dart';

class RouteInfoCubit extends Cubit<RouteInfoState> {
  RouteInfoCubit(this.getRouteInfoUseCase) : super(RouteInfoInitial());
  final GetRouteInfoUseCase getRouteInfoUseCase;

  Future<void> getRouteInfo({required String from, required String to}) async {
    if (from.isEmpty || to.isEmpty) return;
    emit(RouteInfoLoading());
    debugPrint('get rpoute info called in cubit');
    final routeInfo = await getRouteInfoUseCase(Params(from: from, to: to));
    emit(routeInfo.fold(
        (failure) => RouteInfoError(message: _mapFailureToMessage(failure)),
        (routeInfo) => RouteInfoLoaded(routeInfo: routeInfo)));
    debugPrint('can u believe that it is ready so far');
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is JsonParseFailure) {
      return failure.message;
    } else {
      return 'Unexpected situation';
    }
  }
}
