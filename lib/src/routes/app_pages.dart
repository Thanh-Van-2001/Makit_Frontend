import 'package:get/get.dart';
import 'package:mobile_app/src/modules/home/home_binding.dart';
import 'package:mobile_app/src/modules/home/home_page.dart';
import 'package:mobile_app/src/modules/splash/splash_page.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () =>  HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.SPLASH, page: () => const SplashPage())
    // GetPage(name: Routes.LOGIN, page: () => const LoginPage(), binding: LoginBinding()),
    // GetPage(name: Routes.SIGNUP, page: () => const SignupPage(), binding: SignupBinding()),
    // GetPage(name: Routes.NEO, page: () => const NeoPage(), binding: NeoBinding())
  ];
}