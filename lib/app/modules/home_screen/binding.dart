import 'package:get/get.dart';

import 'logic.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenLogic());
  }
}
