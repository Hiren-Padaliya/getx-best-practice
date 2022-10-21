import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/auth/authentication_manager.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class UserHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetX<AuthenticationManager>(
      init: AuthenticationManager(),
      initState: (_) {},
      builder: (logic) {
        String fullName=logic.userData.value.firstname!+" "+logic.userData.value.lastname!;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.sp,
                      child: Center(
                        child: Text(fullName?.substring(0,1)??'Al', style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(
                            fontSize: 12.sp,
                            color: secondaryColor
                          //fontWeight: FontWeight.bold
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w,),
                Text("Hi $fullName", style: Theme
                    .of(context)
                    .textTheme
                    .caption
                    ?.copyWith(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
              ],
            ),
            /*InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/notification.svg",
                fit: BoxFit.contain,),
            )*/
          ],
        );
      },
    );
  }
}
