import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/widgets/bottom_bar/bottom_nav/logic.dart';
import 'package:getx_pattern/app/widgets/bottom_bar/bottom_nav/view.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final nav = Get.put(BottomNavLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: false,
      body: BottomNavPage(),
    );
  }
}
