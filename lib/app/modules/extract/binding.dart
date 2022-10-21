import 'package:get/get.dart';

import 'logic.dart';

class ExtractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExtractLogic());
  }
}
