import 'package:flutter/material.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:sizer/sizer.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        color: Colors.white,
        child: Text("Coming Soon",
          style: appThemeData.textTheme.caption
              ?.copyWith(fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
