import 'package:get/get.dart';
import 'package:getx_part2/utils/utils.dart';

class Validators {
  static String? emaiValidator(String? email) {
    if (email == null || email.isEmpty) {
      Utils.snackBar("Empty Email id", "Please enter your email id");
      return "Enter your email";
    } else if (!GetUtils.isEmail(email)) {
      Utils.snackBar("Incorrect Email", "Please enter correct email id");
      return "Enter correct email";
    }

    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      Utils.snackBar("Empty Password", "Please enter Password");
      return "Enter Password";
    }

    // final RegExp passwordRegExp = RegExp(
    //     r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    // if (!passwordRegExp.hasMatch(password)) {
    //   Utils.snackBar("Weak Password", "Enter Strong Password");
    //   return "Weak Password";
    // }

    return null;
  }
}
