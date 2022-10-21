import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/onboard_model.dart';
import 'package:getx_pattern/app/theme/app_colors.dart';
import 'package:getx_pattern/app/widgets/anim/fading_slider.dart';
import 'package:sizer/sizer.dart';

class WalkThroughScreen extends StatefulWidget {
  final OnBoardModel onboardPageItem;
  const WalkThroughScreen({Key? key, required this.onboardPageItem,  }) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //OnBoardController controller=Get.put(OnBoardController());
    _animationController
      ..duration = Duration(seconds: 2)
      ..forward()
      ..addListener(() {
        /*if (widget.onboardPageItem.animationDuration != null) {
          if (_animationController.lastElapsedDuration >
              widget.onboardPageItem.animationDuration) {
            _animationController.stop();
          }
        }*/
      });

    return Container(
      padding: EdgeInsets.only(top: height * 0.10,left: 10.0,right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: SvgPicture.asset(
              widget.onboardPageItem.imgUrl,
              fit: BoxFit.contain,
              //width: 30.w,
              height: 30.h,
            ),
            /*Image.asset(
              widget.onboardPageItem.imgUrl,
              width: 80.w,
              height: 40.h,
              fit: BoxFit.contain,
            ),*/
          ),
          SizedBox(height: 5.h),
          Flexible(
            child: FadingSlidingWidget(
              animationController: _animationController,
              interval: const Interval(0.2, 0.5),
              child: Text(
                widget.onboardPageItem.title.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: textColor,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Flexible(
            child: FadingSlidingWidget(
              animationController: _animationController,
              interval: const Interval(0.2, 0.5),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.sp),
                child: Text(
                  widget.onboardPageItem.description,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 11.0.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
