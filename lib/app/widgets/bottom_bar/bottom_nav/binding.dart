import 'package:get/get.dart';

import 'logic.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavLogic());
  }
}
