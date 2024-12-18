import 'package:get/get.dart';
import 'package:getx_part2/view_model/controllers/home/home_controller.dart';


class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
