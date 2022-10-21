import 'package:flutter/material.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double? fontSize;

  const ElevatedButtonWidget({Key? key, required this.title, this.onPressed, this.backgroundColor, this.fontSize, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize??11.sp,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor??primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          )),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20.sp,vertical: 8.sp)),
          //shadowColor: MaterialStateProperty.all(secondaryColor)
      ),
    );
  }
}
