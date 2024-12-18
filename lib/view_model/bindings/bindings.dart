import 'package:get/get.dart';
import 'package:getx_part2/view_model/controllers/login/login_controller.dart';

class HomeBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}