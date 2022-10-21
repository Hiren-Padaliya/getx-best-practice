import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/auth/walkthrough/intro_binding.dart';
import 'package:getx_pattern/app/modules/auth/walkthrough/intro_modify.dart';
import 'package:getx_pattern/app/modules/home_screen/binding.dart';
import 'package:getx_pattern/app/modules/home_screen/view.dart';
import 'package:getx_pattern/app/modules/login/binding.dart';
import 'package:getx_pattern/app/modules/login/view.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [

    GetPage(
      name: Routes.BOARD,
      page: () => IntroScreen1(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () =>  HomeScreenPage(),
      binding: HomeScreenBinding(),
    ),
  ];
}