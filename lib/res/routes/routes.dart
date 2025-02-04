import 'package:get/get.dart';
import 'package:getx_part2/res/routes/routes_name.dart';
import 'package:getx_part2/view/login/login_view.dart';
import 'package:getx_part2/view/splash_screen.dart';
import 'package:getx_part2/view/home/home_view.dart';
import 'package:getx_part2/view_model/bindings/home_bindings.dart';
import 'package:getx_part2/view_model/bindings/login_bindings.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
          name: RoutesName.login,
          page: () => const LoginView(),
          binding: LoginBindings(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
          binding: HomeBindings(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        )
      ];
}
