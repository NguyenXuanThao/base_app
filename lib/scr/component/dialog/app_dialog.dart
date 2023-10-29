import 'package:base_app/theme/app_colors.dart';
import 'package:base_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    Key? key,
    this.title,
    this.logoTitle,
    this.msg,
    this.okText = 'Đồng ý',
    this.cancelText,
    this.okHandler,
    this.cancelHandler,
    this.closeHandler,
    this.content,
  }) : super(key: key);

  final String? title;
  final bool? logoTitle;
  final String? msg;
  final String okText;
  final String? cancelText;
  final VoidCallback? okHandler;
  final VoidCallback? cancelHandler;
  final VoidCallback? closeHandler;
  final Widget? content;

  static var isShowing = false;

  @override
  State<AppDialog> createState() => _AppDialogState();

  static void show(
      BuildContext context, {
        String? title,
        String? msg,
        String okText = 'Đồng ý',
        String? cancelText,
        VoidCallback? okHandler,
        VoidCallback? cancelHandler,
        VoidCallback? closeHandler,
        Widget? content,
      }) {
    if (Get.isDialogOpen == true && isShowing) {
      Get.back();
    }
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AppDialog(
          title: title,
          msg: msg,
          okText: okText,
          cancelText: cancelText,
          okHandler: okHandler,
          cancelHandler: cancelHandler,
          closeHandler: closeHandler,
          content: content,
        ),
      ),
      barrierDismissible: false,
    );
    isShowing = true;
  }
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              if (widget.title != null) _buildTitle(context),
              _buildBody(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                child: _buildButtons(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title!,
          style: AppTheme.of(context).medium.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Flexible(
      child: Container(
        padding: (widget.title == null && widget.logoTitle == null)
            ? const EdgeInsets.all(20)
            : const EdgeInsets.only(left: 30, right: 30, top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.msg != null)
              Text(
                widget.msg!,
                style: AppTheme.of(context).regular.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            widget.content ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.green2Color),
      child: Row(
        children: [
          if (widget.cancelText != null || widget.cancelHandler != null) ...[
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                  AppDialog.isShowing = false;
                  if (widget.cancelHandler != null) {
                    widget.cancelHandler!();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    widget.cancelText!,
                    textAlign: TextAlign.center,
                    style: AppTheme.of(context)
                        .regular
                        .copyWith(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 28,
              color: Colors.white,
            )
          ],
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context, true);
                AppDialog.isShowing = false;
                if (widget.okHandler != null) {
                  widget.okHandler!();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  widget.okText,
                  textAlign: TextAlign.center,
                  style: AppTheme.of(context)
                      .regular
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}