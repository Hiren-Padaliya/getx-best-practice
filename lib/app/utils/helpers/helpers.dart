import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<SvgPicture> loadSvg(BuildContext context, String path) async {
  var picture = SvgPicture.asset(path);
  await precachePicture(picture.pictureProvider, context);
  return picture;
}

Future<dynamic> openDialog(controller) {
  return Get.bottomSheet(
      Container(
        //color: Colors.red,
        height: 20.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:  [
              InkWell(
                child: const ListTile(title: Text("Take a Picture"),
                  trailing: Icon(Icons.camera),),
                onTap:controller.captureFile,
              ),
              InkWell(
                child: const ListTile(title: Text("Select from Gallery"),
                  trailing: Icon(Icons.attach_file),),
                onTap:controller.pickFile,
              ),
            ],
          ),
        ),
      ),
      elevation: 20.0,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )
      )
  );
}

enum SNACK {SUCCESS,FAILED}
getSnackBar(String message,SNACK type,{String? title}){
  return Get.snackbar(title??'', '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type==SNACK.SUCCESS?Colors.green:Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      colorText: Colors.white,
      titleText: Container(height: 0,),
      messageText: Text(message,style: TextStyle(color: Colors.white,
          fontSize: 12.sp,fontWeight: FontWeight.normal),),
      padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
      margin: const EdgeInsets.all(0)
  );
}



