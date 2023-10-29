import 'package:base_app/scr/constant/app_icon.dart';
import 'package:base_app/scr/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToNextScreen();
  }

  Future<void> _goToNextScreen() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Thay đổi thời gian trễ tại đây nếu cần
    Get.offAllNamed(AppRoute.main.name!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: const AssetImage(AppIcons.bgSplash),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        const Center(
          child: SizedBox(
            width: 213,
            height: 153,
            child: Image(image: AssetImage(AppIcons.icSplash)),
          ),
        )
      ],
    );
  }
}
