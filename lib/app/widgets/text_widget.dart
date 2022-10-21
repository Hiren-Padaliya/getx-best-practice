import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:sizer/sizer.dart';

class TextInputWidget extends StatelessWidget {
  final String? label;
  final bool isRequired;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? editingController;
 // final MultiValidator? validator;

  //final String? Function(String? value)? validator;
  final int? maxLength;
  final bool? isPassField;
  final bool? obscureText;
  final void Function()? onTogglePassword;
  final List<TextInputFormatter>? inputFormatters;
  final MultiValidator? validator;

  const TextInputWidget(
      {Key? key, this.label, this.hintText, this.textInputType, this.editingController, this.maxLength, this.enabled, this.obscureText, this.onTogglePassword, this.isPassField, required this.isRequired, this.inputFormatters, this.validator,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TextEditorController controller = Get.find();
    return Container(
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            enabled: enabled ?? true,
            //validator: validator ?? MultiValidator([]),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: editingController,
            keyboardType: textInputType ?? TextInputType.text,
            style: appThemeData.textTheme.bodyText1
                ?.copyWith(fontFamily: 'OpenSans',
                fontSize: 12.sp,
                fontWeight:FontWeight.w400,color: textColor),
            decoration: InputDecoration(
              hintText: hintText ?? "Enter Text Here",
              labelText: label,
              //labelText: label??'',
              //helperText: "text",
              errorStyle: appThemeData.textTheme.caption
                  ?.copyWith(color: Colors.red, fontSize: 11.sp,
              fontWeight: FontWeight.w500),
              errorMaxLines: 3,
              focusedErrorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    color: Colors.red),
              ),
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    color: Colors.red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              filled: false,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.sp,vertical: 13.sp),
              suffixIcon: obscureText != null ? GestureDetector(
                onTap: onTogglePassword,
                child: Icon(
                    (obscureText ?? false) ? Icons.visibility : Icons
                        .visibility_off),
              ) : null,
            ),
            onChanged: (value) {},
            maxLength: maxLength,
            obscureText: obscureText ?? false,
            inputFormatters: inputFormatters,
            validator: validator ?? MultiValidator([]),
          ),
        ],
      ),
    );
  }
}
