import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';


class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Future.delayed(Duration.zero)
          .then((value) => Get.toNamed(Routes.BOARD));
      return const CircularProgressIndicator.adaptive();
  }
}
