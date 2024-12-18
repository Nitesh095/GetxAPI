import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_part2/res/colors/app_colors.dart';

class Utils {
  static void onFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toatMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.color,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER);
  }

  static snackBar(String title, String msg) {
    Get.snackbar(title, msg);
  }
}
