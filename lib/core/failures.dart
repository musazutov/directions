import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class JsonParseFailure extends Failure {
  final String message = 'Response parsing failed';
}

class ServerFailure extends Failure {
  final DioError dioError;
  late String message;

  ServerFailure(this.dioError) {
    setMessage();
  }

  void setMessage() {
    switch (dioError.type) {
      case DioErrorType.response:
        if (dioError.response?.statusCode == 401) {
          //handleTokenExpiration();
          message = 'Token expired';
        }

        ///you may parse error message
        // else if (dioError.response?.statusCode == 400 ||
        //     dioError.response?.statusCode == 404) {
        //   message = '';
        // }
        message = 'Error returned from server';
        break;

      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        message = 'Request timed out';
        break;

      default:
        message = 'Something went wrong';
    }
  }
}
