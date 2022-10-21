import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:getx_pattern/app/utils/custom_widgets/disabled_scroll.dart';
import 'package:getx_pattern/app/widgets/user_header.dart';
import 'package:sizer/sizer.dart';

import 'logic.dart';

class HomeScreenPage extends StatelessWidget {
  final logic = Get.find<HomeScreenLogic>();
  final state = Get.find<HomeScreenLogic>().state;

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
              height: 30.h,
              padding: EdgeInsets.only(top: 8.0.sp),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.sp),
                  bottomRight: Radius.circular(20.sp),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("\$ 20,000".toUpperCase(),
                      style: appThemeData.textTheme.caption?.copyWith(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )),
                  Text("Account Balance",
                      style:  appThemeData.textTheme.subtitle1?.copyWith(
                          fontSize: 8.sp,
                          color: Colors.white70,
                          fontWeight: FontWeight.normal
                      )),
                ],
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
            top: 30.h,
            bottom: 10.sp,
            right: 0.sp,
            left: 0.sp,
            child: ScrollConfiguration(
              behavior: DisableScrollGlow(),
              child: ListView(
                padding:  EdgeInsets.symmetric(horizontal: 0.sp),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children:  [
                  Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10.0.sp,
                      vertical: 12.sp),
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10.sp,
                        mainAxisSpacing: 10.sp,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: <Widget>[
                          Card(
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Container(
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/image/tr.png",
                                      width: 15.w,
                                      height: 7.5.h,fit: BoxFit.contain,),
                                    SizedBox(height: 1.2.h,),
                                    Text("Transfer",style: appThemeData.textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 2,
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),

                          Card(
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Container(
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/image/ticket.png",
                                      width: 15.w,
                                      height: 7.5.h,fit: BoxFit.contain,),
                                    SizedBox(height: 1.2.h,),
                                    Text("Ticket",style: appThemeData.textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 2,
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),

                          Card(
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Container(
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/image/qr.png",
                                      width: 15.w,
                                      height: 7.5.h,fit: BoxFit.contain,),
                                    SizedBox(height: 1.2.h,),
                                    Text("Payments",style: appThemeData.textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 2,
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),

                          Card(
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Container(
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/image/recharge.png",
                                      width: 15.w,
                                      height: 7.5.h,fit: BoxFit.contain,),
                                    SizedBox(height: 1.2.h,),
                                    Text("Recharge",style: appThemeData.textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 2,
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),

                          Card(
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Container(
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/image/deposit.png",
                                      width: 15.w,
                                      height: 7.5.h,fit: BoxFit.contain,),
                                    SizedBox(height: 1.2.h,),
                                    Text("Deposit",style: appThemeData.textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 2,
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),

                          Card(
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Container(
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/image/deposit.png",
                                      width: 15.w,
                                      height: 7.5.h,fit: BoxFit.contain,),
                                    Text("Withdraw",style: appThemeData.textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 2,
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
