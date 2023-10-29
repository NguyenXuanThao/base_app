import 'package:base_app/scr/network/model/base/base_response.dart';
import 'package:base_app/scr/network/model/home/home_general_response.dart';
import 'package:base_app/scr/network/repository/app_repository.dart';
import 'package:base_app/scr/network/service/app_service.dart';

class AppServiceApi implements AppRepository {
  final AppService service;

  AppServiceApi({required this.service});

  @override
  Future<BaseResponse<HomeGeneralResponse>> getHomeGeneral() {
    final response = service.getHomeGeneral().then(
        (httpResponse) {
          return httpResponse.data;
        }
    );
    return response;
  }
}