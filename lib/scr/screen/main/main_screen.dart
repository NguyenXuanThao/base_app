import 'package:base_app/scr/component/tabbar/navigation_bar.dart';
import 'package:base_app/scr/component/tabbar/navigation_bar_item.dart';
import 'package:base_app/scr/constant/app_icon.dart';
import 'package:base_app/scr/screen/main/account/account_screen.dart';
import 'package:base_app/scr/screen/main/home/home_screen.dart';
import 'package:base_app/scr/screen/main/order/order_screen.dart';
import 'package:base_app/scr/screen/main/product/product_screen.dart';
import 'package:base_app/scr/screen/main/statistics/statistics_screen.dart';
import 'package:base_app/theme/app_colors.dart';
import 'package:base_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  final List<BottomIndicatorNavigationBarItem> items = [
    BottomIndicatorNavigationBarItem(
        icon: AppIcons.icTabHome, label: 'Trang chủ'),
    BottomIndicatorNavigationBarItem(
        icon: AppIcons.icTabProduct, label: 'Sản phẩm'),
    BottomIndicatorNavigationBarItem(
        icon: AppIcons.icTabOrder, label: 'Đơn hàng'),
    BottomIndicatorNavigationBarItem(
        icon: AppIcons.icTabStatistics, label: 'Thống kê'),
    BottomIndicatorNavigationBarItem(
        icon: AppIcons.icTabAccount, label: 'Tài khoản'),
  ];

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const [
    HomeScreen(),
    ProductScreen(),
    OrderScreen(),
    StatisticsScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: -4, blurRadius: 14),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomIndicatorBar(
            onTap: (index) {
              _onItemTapped(index);
            },
            currentIndex: _selectedIndex,
            items: items,
            iconSize: 24.0,
            indicatorHeight: 4,
            // Set to 0 to hide the indicator bar
            indicatorColor: AppColors.green2Color,
            backgroundColor: AppColors.greyColor,
            activeStyle: AppTheme.of(context)
                .regular
                .copyWith(color: AppColors.green2Color),
            inactiveStyle: AppTheme.of(context)
                .light
                .copyWith(color: AppColors.grey3Color),
          ),
        ),
      ),
    );
  }
}
