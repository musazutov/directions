import 'package:directions/features/route_info/domain/entities/route_info.dart';
import 'package:directions/features/route_info/presentation/bloc/route_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../bloc/route_info_state.dart';
import '../widgets/route_step_list_row.dart';

class RouteInfoPage extends StatelessWidget {
  RouteInfoPage({Key? key}) : super(key: key);

  final RouteInfoCubit _cubit = sl<RouteInfoCubit>();
  final TextEditingController _ctrlFrom = TextEditingController();
  final TextEditingController _ctrlTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Route info'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: _ctrlFrom,
                decoration: const InputDecoration(hintText: 'From'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _ctrlTo,
                decoration: const InputDecoration(hintText: 'To'),
              ),
              TextButton(
                  onPressed: () {
                    if (_cubit.state is! RouteInfoLoading) {
                      _cubit.getRouteInfo(
                          from: _ctrlFrom.text, to: _ctrlTo.text);
                    }
                  },
                  child: const Text('Apply')),
              Expanded(
                child: BlocBuilder<RouteInfoCubit, RouteInfoState>(
                  builder: (context, state) {
                    if (state is RouteInfoLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is RouteInfoLoaded) {
                      return buildRouteInfo(state.routeInfo);
                    } else if (state is RouteInfoError) {
                      return buildErrorWidget(state.message);
                    } else {
                      return const Center(
                          child: Text(
                              'Type city names and press apply to see routes'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRouteInfo(RouteInfo routeInfo) {
    return routeInfo.routeSteps.isEmpty
        ? const Center(
            child: Text(
              'Route is not defined for those names',
              style: TextStyle(color: Color(0xff10275A), fontSize: 14.0),
            ),
          )
        : Column(
            children: [
              Text('Distance: ${routeInfo.distance}'),
              const SizedBox(height: 8),
              Text('Duration: ${routeInfo.duration}'),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: routeInfo.routeSteps.length,
                  itemBuilder: (context, index) {
                    return RouteStepRow(routeInfo.routeSteps[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ],
          );
  }

  Widget buildErrorWidget(String message) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(),
          IconButton(
              onPressed: () {
                _cubit.getRouteInfo(from: 'from', to: 'to');
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
