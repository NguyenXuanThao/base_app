import 'package:base_app/scr/component/dialog/app_dialog.dart';
import 'package:base_app/scr/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class NetworkManager {
  BaseOptions opts = BaseOptions(
    baseUrl: host,
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    followRedirects: false,
  );

  Dio createDio() {
    return Dio(opts);
  }
}

extension OneAppDioException on Dio {
  Dio addInterceptors() {
    return this
      ..interceptors.add(InterceptorsWrapper(
          onRequest: requestInterceptor,
          onError: (DioException error, ErrorInterceptorHandler handle) {
            EasyLoading.dismiss();
            final GlobalManager globalManager = Get.find();
            if (error.response?.statusCode == 401) {
              AppDialog.show(globalManager.navigatorKey.currentContext!,
                  msg:
                      'Phiên đăng nhập của bạn đã hết hạn, vui lòng đăng nhập lại để tiếp tục!');
            } else {
              AppDialog.show(globalManager.navigatorKey.currentContext!,
                  msg: error.message);
            }
          }
          )
      );
  }

  Future requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      options.headers.addAll({'tokendev': tokenDev});
      return handler.next(options);
    } catch (e) {
      return handler.next(options);
    }
  }
}
