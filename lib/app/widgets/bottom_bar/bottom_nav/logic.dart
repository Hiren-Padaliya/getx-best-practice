import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/extract/logic.dart';
import 'package:getx_pattern/app/modules/extract/view.dart';
import 'package:getx_pattern/app/modules/home_screen/logic.dart';
import 'package:getx_pattern/app/modules/home_screen/view.dart';
import 'package:getx_pattern/app/modules/profile/logic.dart';
import 'package:getx_pattern/app/modules/profile/view.dart';
import 'package:getx_pattern/app/widgets/coming_soon_widget.dart';

import 'state.dart';

class BottomNavLogic extends GetxController with SingleGetTickerProviderMixin {
  final BottomNavState state = BottomNavState();
  final hs = Get.put(HomeScreenLogic());
  final ex = Get.put(ExtractLogic());
  final px = Get.put(ProfileLogic());
  final currentPage=0.obs;
  late TabController tabController;
  final List<Widget> colors = [
    HomeScreenPage(),
    ExtractPage(),
    ComingSoonWidget(),
    ComingSoonWidget(),
    ProfilePage()
  ];
  final List<Tab> tabs = [];


  @override
  void onInit() {
    // TODO: implement onInit
    currentPage.value=0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage) {
          changePage(value);
        }
      },
    );

    super.onInit();

  }

  @override
  void dispose() {
    currentPage.value=0;
    tabController.dispose();
    super.dispose();
  }

  void changePage(int newPage) {
    print("newPage $newPage");
    currentPage.value=newPage;
  }
}
