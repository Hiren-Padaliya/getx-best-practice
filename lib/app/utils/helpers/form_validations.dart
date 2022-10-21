import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormValidations {

  //put validation here
  String? requiredField(String? value,{String? errorText}) {
    if (value!.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? requiredDateTimeField(DateTime? value,{String? errorText}) {
    print("requiredDateTimeField $value");
    if (value==null) {
      return 'Field is required';
    }
    return null;
  }

  PatternValidator passwordValidateField(){
    return  PatternValidator(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}',
        errorText: "Minimum eight characters,"
            " at least one uppercase letter,"
            " one lowercase letter,"
            " one number and "
            "one special character");
  }


  MultiValidator validation({required String type,
    required MultiValidator multiValidator,required bool isRequired}) {
    print("validation");
    if(isRequired)multiValidator.validators.add(RequiredValidator(errorText: "This field is required"));

    switch(type){
      case "password" :multiValidator.validators.add(passwordValidateField());break;
      case "email" : multiValidator.validators.add(EmailValidator(errorText: "Email is invalid"));break;
    }
    return multiValidator;
  }
}