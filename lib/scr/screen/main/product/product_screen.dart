import 'package:base_app/scr/component/appbar/app_bar_view.dart';
import 'package:base_app/scr/constant/app_icon.dart';
import 'package:base_app/theme/app_colors.dart';
import 'package:base_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const AppBarView(title: 'Sản phẩm', isHiddenBackButton: true),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon:
                    const Image(image: AssetImage(AppIcons.icSearch)),
                    contentPadding: const EdgeInsets.all(12),
                    isDense: true,
                    filled: true,
                    fillColor: AppColors.grey5Color,
                    border: InputBorder.none,
                    hintText: 'Tìm kiếm',
                    hintStyle: AppTheme.of(context)
                        .regular
                        .copyWith(fontSize: 16, color: AppColors.grey2Color),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
