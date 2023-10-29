import 'package:base_app/scr/screen/main/home/cubit/home_cubit.dart';

import '../screen/main/main_screen.dart';
import '../screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum AppRoute { splash, main }

extension AppRouteExt on AppRoute {
  String? get name {
    switch (this) {
      case AppRoute.splash:
        return '/splash';
      case AppRoute.main:
        return '/main';
      default:
        return null;
    }
  }

  static AppRoute? from(String? name) {
    for (final item in AppRoute.values) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (AppRouteExt.from(settings.name)) {
      case AppRoute.splash:
        return GetPageRoute(
            settings: settings, page: () => const SplashScreen());

      case AppRoute.main:
        return GetPageRoute(
          settings: settings,
          page: () => const MainScreen(),
          bindings: [
            BindingsBuilder.put(() => HomeCubit(Get.find())),
          ],
          transition: Transition.cupertino,
        );

      default:
        return GetPageRoute(
          settings: settings,
          page: () => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
