import 'package:base_app/scr/constant/app_icon.dart';
import 'package:base_app/theme/app_colors.dart';
import 'package:base_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarView extends StatelessWidget {
  const AppBarView(
      {Key? key,
      this.title,
      this.isHiddenBackButton,
      this.trailing,
      this.valueWhenBack})
      : super(key: key);
  final String? title;
  final bool? isHiddenBackButton;
  final Widget? trailing;
  final dynamic valueWhenBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: const AssetImage(AppIcons.icHeaderNavigationBar),
          fit: BoxFit.fill,
          height: 100,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isHiddenBackButton != true)
                InkWell(
                  onTap: (() => Get.back(result: valueWhenBack)),
                  child: const Image(
                    image: AssetImage(AppIcons.icBack),
                    height: 40,
                    width: 40,
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 16, right: 16),
          child: SizedBox(
            height: 40,
            child: Center(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.of(context)
                    .semiBold
                    .copyWith(color: AppColors.grey4Color, fontSize: 20),
                textScaleFactor: 1.0,
              ),
            ),
          ),
        ),
        if (trailing != null)
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, right: 16),
            child: trailing!,
          ),
      ],
    );
  }
}
