import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/AccountData.dart';
import 'package:getx_pattern/app/data/models/UserData.dart';
import 'package:getx_pattern/app/data/provider/api.dart';
import 'package:getx_pattern/app/modules/auth/walkthrough/intro_modify.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';
import 'package:getx_pattern/app/utils/helpers/base64.dart';

import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  final isFirstTime = false.obs;
  final userData=UserData().obs;

  void setUser(UserData data)async{
    userData.value=data;
    await saveUser(data);
  }

  void logOut() {
    isLogged.value = false;
    removeLogin();
    removeToken();
    //ApiClient().removeBaseToken();
    //removeFCMToken();
  }

  void sendToken(String? token) async {
    //isLogged.value = true;
    //Token is cached
    await saveFCMToken(token);
  }

  void checkLoginStatus() {
    final  login = getLoginStatus();
    String baseValue=setBase64();
    ApiClient().setBaseToken(baseValue);
    if(login!=null){
      isLogged.value = login;
      Map<String, dynamic>? userMap = getUserData();
      UserData user=UserData.fromJson(userMap);
      userData.value=user;
    }
  }

  void checkBoardingStatus() {
    final status = getBoardStatus();
    print("checkBoardingStatus $status");
    if (status != null) {
      isFirstTime.value = status;
    }
  }
  void setBoardStatus(bool status) async {
    await saveBoardStatus(status);
  }



  IntroScreen1? navigation() {
    AuthenticationManager _authManager = Get.find();
    if(!_authManager.isFirstTime.value){
      Future.delayed(Duration.zero,(){
        Get.offAndToNamed(Routes.BOARD);
      });
    }else if(_authManager.isLogged.value){
      Future.delayed(Duration.zero,(){
        Get.offAndToNamed(Routes.HOME);
      });
    }else {
      Future.delayed(Duration.zero,(){
        Get.offAllNamed(Routes.LOGIN);
      });
    }
    return null;
  }

}
