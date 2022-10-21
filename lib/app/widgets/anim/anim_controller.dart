import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AnimController extends GetxController with SingleGetTickerProviderMixin  {
  AnimController();

  late AnimationController animationController;
  final duration = const Duration(milliseconds: 1000);

  @override
  void onInit() {
    animationController = AnimationController(duration: duration, vsync: this)
      ..addListener(() => update());

    animationController.forward();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

}