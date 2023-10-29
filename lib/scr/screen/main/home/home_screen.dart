import 'package:base_app/scr/network/bloc/base_bloc_consumer.dart';
import 'package:base_app/scr/network/model/home/home_general_response.dart';
import 'package:base_app/scr/screen/main/home/cubit/home_cubit.dart';
import 'package:base_app/scr/screen/main/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dataGeneral = HomeGeneralResponse();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initData();
    });
  }

  void initData() async {
    Get.find<HomeCubit>().getHomeGeneral();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              if (dataGeneral.banner != null && dataGeneral.banner!.isNotEmpty)
                _buildBody(),
              _buildGetDataSuccess()
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Text(
      dataGeneral.banner![0].urlImage.toString(),
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget _buildGetDataSuccess() {
    return BaseBlocConsumer<HomeCubit, HomeState>(
      baseBloc: Get.find<HomeCubit>(),
      baseListener: (context, state) {
        defaultListener(context, state);

        if (state is HomeGeneralLoadSuccess) {
          final response = state.response;
          setState(() {
            dataGeneral = response ?? HomeGeneralResponse();
          });
          return;
        }
      },
      baseBuilder: (context, state) {
        return Container();
      },
    );
  }
}
