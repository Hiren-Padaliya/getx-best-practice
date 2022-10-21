import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/onboard_model.dart';
import 'package:getx_pattern/app/modules/auth/walkthrough/walkthrough_screen.dart';
import 'package:meta/meta.dart';

class IntroController extends GetxController with SingleGetTickerProviderMixin {
  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "Powerfully secure & simple for business purposes",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ",
      imgUrl: "assets/image/intro.svg",
    ),
    const OnBoardModel(
      title: "Powerfully secure & simple for business purposes",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ",
      imgUrl: "assets/image/intro.svg",
    ),
    const OnBoardModel(
      title: "Powerfully secure & simple for business purposes",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ",
      imgUrl: "assets/image/intro.svg",
    ),
  ];

  final Rx<PageController> pageController = PageController().obs;
  final RxInt pageIndex = 0.obs;
  late AnimationController animationController;
  final duration = const Duration(milliseconds: 1000);
  List<Widget> onboardItems = [];

  @override
  void onInit() {
    initializePages();
    animationController = AnimationController(duration: duration, vsync: this)
      ..addListener(() => update());


    animationController.forward();
    super.onInit();
  }



  initializePages() {
    //onboardItems.add(WelcomePage()); // welcome page with SingleTickerProviderStateMixin
    onBoardData.forEach((onboardPageItem) {
      //adding onboard pages
      onboardItems.add(WalkThroughScreen(
        onboardPageItem: onboardPageItem,
      ));
    });
  }

  bool isLastPage() {
    return pageIndex==onboardItems.length-1;
  }
  void nextPage(){
    pageController.value.animateToPage(pageIndex.value+1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }

}