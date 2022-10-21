import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern/app/data/models/UserData.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }
  Future<bool> saveLogin(bool status) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.LOGIN.toString(), status);
    return true;
  }
  Future<void> removeLogin() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.LOGIN.toString());
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }
  Future<bool> saveFCMToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.FCMTOKEN.toString(), token);
    return true;
  }

  String? getFCMToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.FCMTOKEN.toString());
  }

  Future<void> removeFCMToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.FCMTOKEN.toString());
  }

  bool? getBoardStatus() {
    final box = GetStorage();
    return box.read(CacheManagerKey.BOARDSTATUS.toString());
  }
  bool? getLoginStatus() {
    final box = GetStorage();
    return box.read(CacheManagerKey.LOGIN.toString());
  }

  Future<bool> saveBoardStatus(bool? status) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.BOARDSTATUS.toString(), status);
    return true;
  }

  Future<bool> saveUser(UserData? userData) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USER.toString(), userData!.toJson());
    return true;
  }

  Map<String, dynamic>? getUserData() {
    final box = GetStorage();
    return box.read(CacheManagerKey.USER.toString());
  }

  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USER.toString());
  }

}

enum CacheManagerKey { LOGIN,TOKEN,BOARDSTATUS,FCMTOKEN,USER }
