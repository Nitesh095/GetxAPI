import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_part2/res/routes/routes_name.dart';
import 'package:getx_part2/view_model/controllers/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  void login() {
    final UserPreferences user = UserPreferences();

    Timer(const Duration(seconds: 2), () {
      user.getUser().then((value) {
        value.token == "" && value.token.isEmpty
            ? Get.offNamed(RoutesName.login)
            : Get.offNamed(RoutesName.homeScreen);
      });
    });
  }
}
