import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/auth/authentication_manager.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:getx_pattern/app/utils/custom_widgets/disabled_scroll.dart';
import 'package:getx_pattern/app/widgets/elevated_button.dart';
import 'package:getx_pattern/app/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.find<ProfileLogic>();
  final state = Get
      .find<ProfileLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Container(
        width:double.infinity,
        decoration: gradientDecoration(),
      ),*/
        Positioned(
            top: 0.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              height: 15.h,
              padding: EdgeInsets.only(top: 8.0.sp),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.sp),
                  bottomRight: Radius.circular(20.sp),
                ),
              ),
            )
        ),

        Positioned(
            top: 6.h,
            left: 5.w,
            child: Icon(FontAwesome.edit, color: Colors.white,)
        ),
        Positioned(
            top: 6.h,
            right: 5.w,
            child: SvgPicture.asset(
              "assets/image/menu.svg",
              fit: BoxFit.contain,)
        ),

        Positioned(
            top: 22.h,
            bottom: 0.sp,
            right: 0.sp,
            left: 0.sp,
            child: ScrollConfiguration(
              behavior: DisableScrollGlow(),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 2.sp,),
                  Material(
                    elevation: 1,
                    clipBehavior: Clip.hardEdge,
                    type: MaterialType.circle,
                    color: Colors.grey[200],
                    child: Image.asset("assets/image/avtar.png",
                      fit: BoxFit.contain,
                      width: 120.0,
                      height: 120.0,),
                  ),
                  GetX<AuthenticationManager>(
                    init: AuthenticationManager(),
                    initState: (_) {},
                    builder: (logic) {
                      return Center(child: Text(logic.userData.value.firstname??'',
                          style: appThemeData.textTheme.caption
                              ?.copyWith(fontWeight: FontWeight.bold,
                              fontSize: 16.sp, color: primaryColor)
                      ));
                    },
                  ),
                  Center(
                    child: ElevatedButtonWidget(title: "Sign Out",
                        onPressed: () {
                          logic.signOut();
                        },
                        backgroundColor: primaryColor),
                  )

                ],
              ),
            )),

      ],
    );
  }
}
