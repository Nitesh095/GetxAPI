import 'package:getx_part2/model/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(LoginResponseModel loginResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", loginResponse.token);
    return true;
  }

  Future<LoginResponseModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return LoginResponseModel(token: token ?? "");
  }

  Future<bool> logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
