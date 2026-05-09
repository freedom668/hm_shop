import 'package:flutter/material.dart';

class ToastUtils {
  static bool showloading = false;
  static void showToast(BuildContext context, String? msg) {
    if (showloading) {
      return;
    }
    showloading = true;
    Future.delayed(Duration(seconds: 2), () {
      showloading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}
