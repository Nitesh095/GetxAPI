import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/model/login/login_response_model.dart';
import 'package:getx_part2/repository/login_repository/login_repository.dart';
import 'package:getx_part2/res/routes/routes_name.dart';
import 'package:getx_part2/utils/utils.dart';
import 'package:getx_part2/view_model/controllers/user_preferences/user_preferences_view_model.dart';

class LoginController extends GetxController {
  final _login = LoginRepository();
  final UserPreferences user = UserPreferences();

  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  Future login() async {
    loading.value = true;

    var data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };

    _login.loginApi(data).then((value) {
      user.saveUser(LoginResponseModel.fromJson(value)).then((value) {
        Get.offNamed(RoutesName.homeScreen);
      });
      loading.value = false;
      Utils.snackBar(
          "Login Success", "You have successfully entered in your account");
    }).onError((error, stacktrace) {
      loading.value = false;
      Utils.snackBar("Login Error", "There is some issue in your login");
    });
  }
}
