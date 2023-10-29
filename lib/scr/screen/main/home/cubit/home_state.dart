import 'package:base_app/scr/network/bloc/base_state.dart';
import 'package:base_app/scr/network/model/home/home_general_response.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoadProgress extends HomeState implements DefaultLoadingState {}

class HomeGeneralLoadSuccess extends HomeState {
  final HomeGeneralResponse? response;
  HomeGeneralLoadSuccess(this.response);
}


class HomeLoadFailure extends HomeState implements DefaultFailureState {
  @override
  final dynamic error;

  const HomeLoadFailure(this.error);
}