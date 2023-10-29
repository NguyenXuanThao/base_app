import 'package:base_app/scr/component/dialog/app_dialog.dart';
import 'package:base_app/scr/network/bloc/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void defaultListener(context, state) {
  if (state is DefaultLoadingState) {
    EasyLoading.show(status: '');
    return;
  }

  EasyLoading.dismiss();

  if (state is DefaultFailureState) {
    final error = state.error;
    AppDialog.show(context, msg: error.toString());
    return;
  }
}

class BaseBlocConsumer<B extends BlocBase<S>, S> extends BlocConsumer<B, S> {
  final BlocWidgetBuilder<S> baseBuilder;
  final BlocWidgetListener<S>? baseListener;
  final B? baseBloc;
  final BlocBuilderCondition<S>? baseBuildWhen;
  final BlocListenerCondition<S>? baseListenWhen;

  const BaseBlocConsumer({
    Key? key,
    this.baseBloc,
    required this.baseBuilder,
    this.baseListener,
    this.baseListenWhen,
    this.baseBuildWhen,
  }) : super(
    key: key,
    bloc: baseBloc,
    listener: baseListener ?? defaultListener,
    builder: baseBuilder,
    listenWhen: baseListenWhen,
    buildWhen: baseBuildWhen,
  );
}
