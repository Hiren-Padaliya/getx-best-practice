import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/UserData.dart';
import 'package:getx_pattern/app/data/models/UserModel.dart';
import 'package:getx_pattern/app/data/repository/auth/auth_repository.dart';
import 'package:getx_pattern/app/modules/auth/authentication_manager.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';
import 'package:getx_pattern/app/utils/helpers/helpers.dart';
import 'state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();
  final AuthRepository? authRepo;
  LoginController({required this.authRepo,});

  final registerFormKey = GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  final _onSubmitCall=false.obs;
  set onSubmitCall(value)=>_onSubmitCall.value=value;
  get onSubmitCall => _onSubmitCall.value;

  @override
  void onInit() {

    super.onInit();
  }

  void submit() {
    if(registerFormKey.currentState!.validate()){
      onSubmitCall=true;
      authRepo?.loginUser(
          jsonData:{"email":emailController.text,"password":passwordController.text}
      )?.then((response) async {
        if (response != null) {
          onSubmitCall = false;
          if (response.statusCode == 200) {
            if(response.data['success']=true){
              UserData data=UserData.fromJson(response.data);
              Future.delayed(const Duration(seconds: 1)).then((value) {
                AuthenticationManager authenticationManager = Get.find();
                authenticationManager.saveLogin(true);
                authenticationManager.setUser(data);
                authenticationManager.saveToken(data.token);
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  Get.offAllNamed(Routes.HOME);
                });
              });
            }else{
              getSnackBar(response.data['Message']??'Something went wrong. Please try again...', SNACK.FAILED);
            }
          } else {
            getSnackBar(response.data['Message']??'Something went wrong. Please try again...', SNACK.FAILED);
          }
        } else {
          getSnackBar(response.data['Message']??'Something went wrong. Please try again...', SNACK.FAILED);
        }
      });
    }


  }
}
