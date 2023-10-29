import 'package:base_app/scr/constant/constant.dart';
import 'package:base_app/scr/route/app_route.dart';
import 'package:base_app/theme/app_theme.dart';
import 'package:base_app/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_app/utils/dependencies.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  provideDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalManager _globalManager = Get.find();

  @override
  void initState() {
    EasyLoading.instance
    //[showSuccess] [showError] [showInfo] [showToast] settings
    // ..displayDuration = const Duration(milliseconds: 2000)
    //[Loading] settings
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 24.0
    // ..radius = 10.0
      ..maskType = EasyLoadingMaskType.custom
      ..boxShadow = <BoxShadow>[]
      ..progressColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black54
      ..userInteractions = false
      ..dismissOnTap = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _globalManager.navigatorKey,
        initialRoute: AppRoute.splash.name,
        theme: CustomTheme.fromContext(context).appTheme,
        builder: EasyLoading.init(builder: (context, child) {
          return AppTheme(child: child!);
        }),
        onGenerateRoute: AppRouteExt.generateRoute,
      ),
    );
  }
}
