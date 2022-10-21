import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:getx_pattern/app/utils/custom_widgets/disabled_scroll.dart';
import 'package:getx_pattern/app/widgets/user_header.dart';
import 'package:sizer/sizer.dart';

import 'logic.dart';

class ExtractPage extends StatelessWidget {
  final logic = Get.find<ExtractLogic>();
  final state = Get.find<ExtractLogic>().state;

   ExtractPage({Key? key}) : super(key: key);

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
              height: 20.h,
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
            top: 5.h,
            left: 5.w,
            right: 5.w,
            child: UserHeader()
        ),

        Positioned(
            top: 22.h,
            bottom: 0.sp,
            right: 0.sp,
            left: 0.sp,
            child: ScrollConfiguration(
              behavior: DisableScrollGlow(),
              child: ListView(
                padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children:  [
                  SizedBox(height: 5.sp,),
                  Container(height: 50,color: primaryColor.withOpacity(0.2),
                  child: Center(child: Text("Filter Coming Soon",style: appThemeData.textTheme.caption,),),),
                  SizedBox(height: 5.sp,),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                     return itemBuilder(index);
                    },)
                ],
              ),
            ))
      ],
    );
  }

  Widget itemBuilder(int index) {
    return Card(
        elevation: 2,
        child: ListTile(
          onTap: (){},
          tileColor: Colors.transparent,
          title:
          Text("Bradescard bank transfer",
            style: appThemeData.textTheme.caption,),
          trailing: Text("- \$ 1,000",
              style: appThemeData.textTheme.caption
                  ?.copyWith(color: (index%2==0)?Colors.red:Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp
              )),
          subtitle: Text("24-04-2022",
              style: appThemeData.textTheme.subtitle1),
        )
    );
  }
}
