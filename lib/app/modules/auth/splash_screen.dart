import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:getx_pattern/app/widgets/anim/anim_controller.dart';
import 'package:getx_pattern/app/widgets/anim/fading_slider.dart';
import 'package:getx_pattern/app/widgets/main_page.dart';
import 'package:sizer/sizer.dart';

import 'authentication_manager.dart';

class SplashScreen extends StatelessWidget  {
  final AuthenticationManager _manager = Get.put(AuthenticationManager(),permanent: true);

    SplashScreen({Key? key}) : super(key: key);

   Future<void> initializeSettings() async {
     _manager.checkBoardingStatus();
     _manager.checkLoginStatus();

     //Simulate other services for 3 seconds
     await Future.delayed(const Duration(seconds: 5));
   }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {

        }else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else if(snapshot.connectionState == ConnectionState.done) {
           /* Future.delayed(Duration.zero,(){
              Get.toNamed(Routes.BOARD);
            });*/
            _manager.navigation();

          }
        }
        return splashView();
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  MainPage splashView() {
    AnimController controller=Get.put(AnimController());

    return MainPage(
        body: Stack(
          children: [
            Container(
              width:double.infinity,
              color: Colors.white,
            ),

            Center(
              child: FadingSlidingWidget(
                animationController: controller.animationController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("GetX App",style: appThemeData.textTheme.caption
                        ?.copyWith(color: Colors.red,
                        fontWeight: FontWeight.bold,fontSize: 30.sp),),

                    /*Text("",style: appThemeData.textTheme.subtitle1
                        ?.copyWith(color: primaryColor,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,fontSize: 12.sp),)*/
                  ],
                ),
              ),
            ),


          ],
        ));
  }
}