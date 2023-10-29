import 'dart:io';

import 'package:base_app/scr/network/core/network_manager.dart';
import 'package:base_app/scr/network/model/base/base_response.dart';
import 'package:base_app/scr/network/model/home/home_general_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'app_service.g.dart';

@RestApi()
abstract class AppService {
  factory AppService(Dio dio, {String? baseUrl}) = _AppService;

  static AppService create() {
    final dio = NetworkManager().createDio()
      ..interceptors
          .add(PrettyDioLogger(requestBody: true, requestHeader: true))
      ..addInterceptors();
    final client = AppService(dio);
    return client;
  }

  @GET('/api/noauth/listNewsHome')
  Future<HttpResponse<BaseResponse<HomeGeneralResponse>>> getHomeGeneral();
}
