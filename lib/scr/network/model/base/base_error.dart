import 'package:base_app/scr/network/model/base/error_response.dart';
import 'package:dio/dio.dart';

class BaseError implements Exception {
  ErrorResponse? resError;
  DioException? dioError;

  /// The original error/exception object
  dynamic error;

  BaseError({this.resError, this.dioError, this.error});

  String get message {
    String msg = '';
    if (resError != null) {
      final message = resError?.message ?? '';
      if (message.isNotEmpty) {
        msg = '';
      }

      final error = resError?.error ?? '';
      if (msg.isEmpty && error.isNotEmpty) {
        msg = error;
      }
    } else if (dioError != null) {
      msg = dioError.toString();
    } else if (error != null) {
      msg = error.toString();
    }

    return msg.isEmpty ? 'Unexpected Error Exception' : msg;
  }

  @override
  String toString() {
    var msg = 'OneError : $message';
    if (error is Error) {
      msg += '\n${error.stackTrace}';
    }
    return msg;
  }
}