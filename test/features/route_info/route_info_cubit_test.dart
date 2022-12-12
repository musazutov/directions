import 'package:directions/features/route_info/domain/usecases/get_route.info.dart';
import 'package:directions/features/route_info/presentation/bloc/route_info_cubit.dart';
import 'package:directions/features/route_info/presentation/bloc/route_info_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRouteInfoUseCase extends Mock implements GetRouteInfoUseCase {}

void main() {
  late RouteInfoCubit sut;
  late MockRouteInfoUseCase mockRouteInfoUseCase;

  setUp(() {
    mockRouteInfoUseCase = MockRouteInfoUseCase();
    sut = RouteInfoCubit(mockRouteInfoUseCase);
  });

  test(
    'should emit inital state first',
    () {
      expect(sut.state, equals(RouteInfoInitial()));
      //    expect(sut.isLoading, false);
    },
  );
}
