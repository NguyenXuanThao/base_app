import 'dart:io';

import 'package:base_app/scr/network/model/base/base_response.dart';
import 'package:base_app/scr/network/model/home/home_general_response.dart';

abstract class AppRepository {
  Future<BaseResponse<HomeGeneralResponse>> getHomeGeneral();
}
