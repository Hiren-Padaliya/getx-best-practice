import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/UserData.dart';
import 'package:getx_pattern/app/data/models/UserModel.dart';
import 'package:getx_pattern/app/data/provider/api.dart';
import 'package:getx_pattern/app/utils/helpers/form_validations.dart';


class AuthRepository {
  final ApiClient? apiClient;
  final FormValidations? validation;

  AuthRepository({this.validation,this.apiClient});

   loginUser({required Map<String, dynamic> jsonData,dynamic param}){
    //return apiClient?.post('/login',jsonData: jsonData);
     return Response(statusCode: 200,body: returnUser());
  }

  registerUser({required Map<String, dynamic> jsonData,dynamic param}){
    return apiClient?.post('',jsonData: jsonData);
  }

  returnUser() {
    return {
      "success":true,
      "message":"Login Success",
      "data":{
        "id":1,
        "firstname":"Admin",
        "lastname":"Admin",
        "email": "admin@gmail.com",
        "active":true
    }};
  }


}

