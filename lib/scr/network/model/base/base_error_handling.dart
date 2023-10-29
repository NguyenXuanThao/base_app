import 'dart:developer';

import 'package:base_app/scr/network/model/base/base_error.dart';
import 'package:base_app/scr/network/model/base/error_response.dart';
import 'package:dio/dio.dart';

class BaseErrorHandling {
  onError(Object obj) {
    switch (obj.runtimeType) {
      case DioException:
        final res = (obj as DioException).response;
        if (res != null) {
          final resError = res.data is Map<String, dynamic>
              ? ErrorResponse.fromJson(res.data)
              : null;
          final error = BaseError(dioError: obj, resError: resError);
          throw assureError(error);
        } else {
          final error = BaseError(dioError: obj);
          throw assureError(error);
        }
      default:
        throw assureError(obj);
    }
  }

  static BaseError assureError(err) {
    BaseError error;
    if (err is BaseError) {
      error = err;
    } else {
      error = BaseError(error: err);
    }
    log(error.toString());
    return error;
  }
}