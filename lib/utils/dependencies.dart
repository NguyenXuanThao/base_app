import 'package:base_app/scr/constant/constant.dart';
import 'package:base_app/scr/network/repository/app_repository.dart';
import 'package:base_app/scr/network/repository/app_storage.dart';
import 'package:base_app/scr/network/service/app_service.dart';
import 'package:base_app/scr/network/service/app_service_api.dart';
import 'package:get/get.dart';

void provideDependencies() {
  Get.lazyPut(() => AppService.create(), fenix: true);

  Get.lazyPut(() => GlobalManager(), fenix: true);

  Get.lazyPut<AppRepository>(
      () => AppStorage(repo: AppServiceApi(service: Get.find())),
      fenix: true);
}
