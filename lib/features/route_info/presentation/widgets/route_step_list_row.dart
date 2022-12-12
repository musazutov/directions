import 'package:flutter/material.dart';

import '../../domain/entities/route_step.dart';

class RouteStepRow extends StatelessWidget {
  const RouteStepRow(
    this.routeStep, {
    Key? key,
  }) : super(key: key);

  final RouteStep routeStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          Text(
              'Direction: ${routeStep.direction == 'turn-right' ? '->' : routeStep.direction == 'turn-left' ? '<-' : '<>'}'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/temperature.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Text(routeStep.weather?.temperature.toString() ?? ''),
            ],
          ),
          const SizedBox(height: 10),
          Text(routeStep.weather?.description ?? ''),
        ],
      ),
    );
  }
}
