import 'package:base_app/scr/network/model/base/base_error_handling.dart';
import 'package:base_app/scr/network/model/base/base_response.dart';
import 'package:base_app/scr/network/model/home/home_general_response.dart';
import 'package:base_app/scr/network/repository/app_repository.dart';

class AppStorage implements AppRepository {
  final AppRepository repo;

  const AppStorage({
    required this.repo,
  });

  @override
  Future<BaseResponse<HomeGeneralResponse>> getHomeGeneral() async {
    return repo.getHomeGeneral().catchError(BaseErrorHandling().onError);
  }
}
