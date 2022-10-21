import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:getx_pattern/app/utils/custom_widgets/disabled_scroll.dart';
import 'package:getx_pattern/app/widgets/elevated_button.dart';
import 'package:getx_pattern/app/widgets/main_page.dart';
import 'package:getx_pattern/app/widgets/outlined_button.dart';
import 'package:getx_pattern/app/widgets/text_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import 'logic.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginController>();

    return MainPage(
        body: Obx(() {
          return ModalProgressHUD(
            inAsyncCall: logic.onSubmitCall,
            color: primaryColor.withOpacity(0.6),
            progressIndicator: SpinKitFadingCircle(
              color: primaryColor, size: 12.h,),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 8.h,
                    bottom: 0.sp,
                    right: 10.sp,
                    left: 10.sp,
                    child: ScrollConfiguration(
                      behavior: DisableScrollGlow(),
                      child: Form(
                        key: logic.registerFormKey,
                        child: Center(
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 8.sp),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              const SizedBox(height: 8,),
                              Center(
                                child:  Text("GetX App",style: appThemeData.textTheme.caption
                                    ?.copyWith(color: Colors.red,
                                    fontWeight: FontWeight.bold,fontSize: 28.sp),),
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const BackButton(),
                                  Text("Sign In".toUpperCase(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                        color: textColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ],
                              ),
                              SizedBox(height: 1.h,),

                              TextInputWidget(
                                isRequired: true,
                                hintText: "Email",
                                editingController: logic.emailController,
                                textInputType: TextInputType.emailAddress,
                                validator: logic.authRepo?.validation
                                    ?.validation(
                                    type: 'email',
                                    multiValidator: MultiValidator([]),
                                    isRequired: true
                                ),
                                //obscureText: false,
                                //onTogglePassword: () => logic.toggle(),

                              ),
                              SizedBox(height: 3.h,),

                              TextInputWidget(
                              isRequired: true,
                              //label: "Enter Password",
                              hintText: "Password",
                              editingController: logic.passwordController,
                              textInputType: TextInputType.text,
                              obscureText: true,
                              //onTogglePassword: () => logic.toggle(),
                            ),

                              SizedBox(height: 3.h,),
                              ElevatedButtonWidget(
                                title: 'LogIn'.toUpperCase(),
                                fontSize: 13.sp,
                                onPressed:(){logic.submit();},
                              ),
                              SizedBox(height: 0.3.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Forgot Password?",
                                        style: appThemeData.textTheme
                                            .subtitle1),
                                    const SizedBox(width: 2,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an Account?",
                                      style: appThemeData.textTheme.subtitle1
                                          ?.copyWith(fontSize: 12.sp)),
                                  const SizedBox(height: 4,),
                                  OutLinedButtonWidget(
                                    title: 'Create an account'.toUpperCase(),
                                    fontSize: 13.sp,
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    ))
              ],
            ),
          );
        })
    );
  }
}
