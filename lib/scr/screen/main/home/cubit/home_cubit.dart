import 'package:base_app/scr/constant/constant.dart';
import 'package:base_app/scr/network/repository/app_repository.dart';
import 'package:base_app/scr/screen/main/home/cubit/home_state.dart';
import 'package:base_app/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final logger = getLogger("HomeCubit");

class HomeCubit extends Cubit<HomeState> {
  final AppRepository repo;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getHomeGeneral() async {
    try {
      emit(HomeLoadProgress());
      final response = await repo.getHomeGeneral();
      if (response.status == ResponseStatus.success) {
        emit(HomeGeneralLoadSuccess(response.data));
      } else {
        emit(HomeLoadFailure(response.message));
      }
    } catch (e) {
      logger.d('HomeLoadFailure error$e');
      emit(HomeLoadFailure(e));
    }
  }
}
