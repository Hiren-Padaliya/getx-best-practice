import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/auth/authentication_manager.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';
import 'package:getx_pattern/app/widgets/bottom_bar/bottom_nav/logic.dart';
import 'package:getx_pattern/app/widgets/progress_dialog_utils.dart';

import 'state.dart';

class ProfileLogic extends GetxController {
  final ProfileState state = ProfileState();

  void signOut() {
    final logic = Get.find<BottomNavLogic>();
    ProgressDialogUtils.showProgressDialog();
    AuthenticationManager manager = Get.find();
    manager.logOut();
    logic.currentPage.value=0;
    logic.tabController.index=0;

    Future.delayed(const Duration(seconds: 5)).then((value) {
      ProgressDialogUtils.hideProgressDialog();
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}
