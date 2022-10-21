import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/widgets/bottom_bar/bottom_nav/bottom_bar.dart';
import 'package:sizer/sizer.dart';

import 'logic.dart';

class BottomNavPage extends StatelessWidget {
  final logic = Get.find<BottomNavLogic>();
  final state = Get
      .find<BottomNavLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = primaryColor.computeLuminance() < 0.5
        ? Colors.black
        : Colors.white;
    print("logic.currentPage.value: ${logic.currentPage.value}");
    return BottomBarWidget(
      child: Obx(() {
        return TabBar(
          //padding: EdgeInsets.symmetric(vertical: 8.0),
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: logic.tabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: /*Icon(
                    Icons.home,
                    color: logic.currentPage.value == 0 ?  primaryColor: unselectedColor,
                  )*/
                Image.asset("assets/image/home.png", fit: BoxFit.contain,
                  color: logic.currentPage.value == 0 ? primaryColor : Colors
                      .black,
                  height: 5.h,
                  width: 8.w,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Image.asset(
                    "assets/image/extract.png", fit: BoxFit.contain,
                    color: logic.currentPage.value == 1 ? primaryColor : Colors
                        .black,
                    height: 5.h,
                    width: 8.w,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Image.asset(
                    "assets/image/pix.png", fit: BoxFit.contain,
                    color: logic.currentPage.value == 2 ? primaryColor : Colors
                        .black,
                    height: 5.h,
                    width: 8.w,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Image.asset(
                    "assets/image/card.png", fit: BoxFit.contain,
                    color: logic.currentPage.value == 3 ? primaryColor : Colors
                        .black,
                    height: 5.h,
                    width: 8.w,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Image.asset(
                    "assets/image/person.png", fit: BoxFit.contain,
                    color: logic.currentPage.value == 4 ? primaryColor : Colors
                        .black,
                    height: 5.h,
                    width: 8.w,)),
            ),
          ],
        );
      }),
      fit: StackFit.expand,
      icon: const Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          icon: Icon(
            Icons.arrow_upward_rounded,
            color: Colors.black,
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(10),
      duration: Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.92,
      barColor: primaryColor.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white,
      start: 2,
      end: 0,
      bottom: 10,
      alignment: Alignment.center,
      iconHeight: 35,
      iconWidth: 35,
      reverse: false,
      hideOnScroll: true,
      scrollOpposite: false,
      onBottomBarHidden: () {},
      onBottomBarShown: () {},
      body: (context, controller) =>
          TabBarView(
            controller: logic.tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: logic.colors
                .map((e) => e)
                .toList(),
          ),
    );
  }
}
