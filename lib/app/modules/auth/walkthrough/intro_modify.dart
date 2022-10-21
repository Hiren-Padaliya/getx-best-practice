import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/widgets/elevated_button.dart';
import 'package:getx_pattern/app/widgets/main_page.dart';

import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../authentication_manager.dart';
import 'intro_controller.dart';

class IntroScreen1 extends GetView<IntroController> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return MainPage(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Obx(() {
            return Positioned.fill(
              top: 8.h,
              child: PageView(
                controller: controller.pageController.value,
                children: controller.onboardItems,
                onPageChanged: (page) {
                  print("page $page");
                  controller.pageIndex.value = page;
                },
              ),
            );
          }),
          Positioned(
            bottom: 15.h,
            child: SmoothPageIndicator(
              controller: controller.pageController.value,
              count: controller.onboardItems.length,
              effect: WormEffect(
                dotWidth: width * 0.05,
                dotHeight: width * 0.02,
                dotColor: Colors.grey,
                activeDotColor: secondaryColor,
              ),
            ),
          ),
          Positioned(
              bottom: 20.sp,
              //width: 60.sp,
              child: ElevatedButtonWidget(
                onPressed: () {
                  controller.isLastPage()?
                      (){
                        AuthenticationManager authenticationManager=Get.find();
                        authenticationManager.setBoardStatus(true);
                        Get.offAllNamed(Routes.LOGIN);
                      }():controller.nextPage();

                  /*print(controller.pageIndex.value);
                  controller.isLastPage() ?
                      () {}() : controller.pageController.value*/
                }, title: 'Next',
              )
          ),

          /*Obx(() {
            return Positioned(
                bottom: 10.sp,
                right: 10.sp,
                child: FadingSlidingWidget(
                  animationController: controller.animationController,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    alignment: Alignment.centerRight,
                    //width: width * 0.8,
                    //height: height * 0.075,
                    child: controller.isLastPage() ? IconButton(
                      icon: const Icon(Icons.navigate_next),
                      iconSize: width * 0.05,
                      color: Colors.white,
                      onPressed: () {
                        AuthenticationManager authenticationManager=Get.find();
                        authenticationManager.setBoardStatus(true);
                        Get.offAndToNamed(Routes.LOGIN);
                      },
                    )
                        : Container(height: 0,),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 0.1),
                        ),
                        color: controller.isLastPage() ? primaryColor : Colors
                            .white
                    ),
                  ),
                )
            );
          })*/
        ],
      ),
    );
  }
}
