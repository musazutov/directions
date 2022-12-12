import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final double temperature;

  const Weather({required this.description, required this.temperature});

  @override
  List<Object> get props => [description, temperature];
}
