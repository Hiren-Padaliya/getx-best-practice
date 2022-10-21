import 'package:get/get.dart';
import 'package:getx_pattern/app/data/provider/api.dart';
import 'package:getx_pattern/app/data/repository/auth/auth_repository.dart';
import 'package:getx_pattern/app/utils/helpers/form_validations.dart';

import 'logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
        authRepo:AuthRepository(apiClient: ApiClient(),validation:FormValidations()))
    );
  }
}
