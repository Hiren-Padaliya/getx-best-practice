import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getx_pattern/app/widgets/bottom_bar/bottom_nav/bottom_bar_controller.dart';

/// A floating bottom navigation bar that hides on scroll
/// up and down on the page, with powerful options
/// for controlling the look and feel.
class BottomBarWidget extends StatefulWidget {
  /// The widget displayed below the `BottomBar`.
  ///
  /// This is useful, if the `BottomBar` should react
  /// to scroll events (i.e. hide from view when a [Scrollable]
  /// is being scrolled down and show it again when scrolled up).
  ///
  /// For that, use this exposed `ScrollController` and
  /// you can also add listeners on this `ScrollController`.
  final Widget Function(BuildContext context, ScrollController controller) body;

  ///
  /// This is the child inside the `BottomBar`.
  /// Add a TabBar or any other thing that you want to be floating here.
  final Widget child;

  ///
  /// This is the scroll to top button. It will be hidden when the
  /// `BottomBar` is scrolled up. It will be shown when the `BottomBar`
  /// is scrolled down. Clicking it will scroll the bar on top.
  ///
  /// You can hide this by using the `showIcon` property.
  final Widget icon;

  ///
  /// The width of the scroll to top button.
  final double iconWidth;

  ///
  /// The height of the scroll to top button.
  final double iconHeight;

  ///
  /// The color of the `BottomBar`.
  final Color barColor;

  ///
  /// The end position in `y-axis` of the SlideTransition of the `BottomBar`.
  final double end;

  ///
  /// The start position in `y-axis` of the SlideTransition of the `BottomBar`.
  final double start;

  ///
  /// The position of the bar from the bottom in double.
  final double bottom;

  ///
  /// The duration of the `SlideTransition` of the `BottomBar`.
  final Duration duration;

  ///
  /// The curve of the `SlideTransition` of the `BottomBar`.
  final Curve curve;

  ///
  /// The width of the `BottomBar`.
  final double width;

  ///
  /// The border radius of the `BottomBar`.
  final BorderRadius borderRadius;

  ///
  /// If you don't want the scroll to top button to be visible,
  /// set this to `false`.
  final bool showIcon;

  ///
  /// The alignment of the Stack in which the `BottomBar` is placed.
  final Alignment alignment;

  ///
  /// The callback when the `BottomBar` is shown i.e. on response to scroll events.
  final Function()? onBottomBarShown;

  ///
  /// The callback when the `BottomBar` is hidden i.e. on response to scroll events.
  final Function()? onBottomBarHidden;

  ///
  /// To reverse the direction in which the scroll reacts, i.e. if you want to make
  /// the bar visible when you scroll down and hide it when you scroll up, set this
  /// to `true`.
  final bool reverse;

  ///
  /// To reverse the direction in which the scroll to top button scrolls, i.e. if
  /// you want to scroll to bottom, set this to `true`.
  final bool scrollOpposite;

  ///
  /// If you don't want the bar to be hidden ever, set this to `false`.
  final bool hideOnScroll;

  ///
  /// The fit property of the `Stack` in which the `BottomBar` is placed.
  final StackFit fit;

  const BottomBarWidget({
    required this.body,
    required this.child,
    this.icon = const Center(
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: null,
        icon: Icon(
          Icons.arrow_upward_rounded,
          color: Colors.black,
        ),
      ),
    ),
    this.iconWidth = 40,
    this.iconHeight = 40,
    this.barColor = Colors.black,
    this.end = 0,
    this.start = 2,
    this.bottom = 10,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
    this.width = 300,
    this.borderRadius = BorderRadius.zero,
    this.showIcon = true,
    this.alignment = Alignment.bottomCenter,
    this.onBottomBarShown,
    this.onBottomBarHidden,
    this.reverse = false,
    this.scrollOpposite = false,
    this.hideOnScroll = true,
    this.fit = StackFit.loose,
    Key? key,
  }) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget>
    with SingleTickerProviderStateMixin {
  ScrollController scrollBottomBarController = ScrollController();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late bool isScrollingDown;
  late bool isOnTop;

  @override
  void initState() {
    isScrollingDown = widget.reverse;
    isOnTop = !widget.reverse;
    myScroll();
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, widget.start),
      end: Offset(0, widget.end),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.forward();
  }

  void showBottomBar() {
    if (mounted) {
      setState(() {
        _controller.forward();
      });
    }
    if (widget.onBottomBarShown != null) widget.onBottomBarShown!();
  }

  void hideBottomBar() {
    if (mounted && widget.hideOnScroll) {
      setState(() {
        _controller.reverse();
      });
    }
    if (widget.onBottomBarHidden != null) widget.onBottomBarHidden!();
  }

  Future<void> myScroll() async {
    scrollBottomBarController.addListener(() {
      if (!widget.reverse) {
        if (scrollBottomBarController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!isScrollingDown) {
            isScrollingDown = true;
            isOnTop = false;
            hideBottomBar();
          }
        }
        if (scrollBottomBarController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isScrollingDown) {
            isScrollingDown = false;
            isOnTop = true;
            showBottomBar();
          }
        }
      } else {
        if (scrollBottomBarController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!isScrollingDown) {
            isScrollingDown = true;
            isOnTop = false;
            hideBottomBar();
          }
        }
        if (scrollBottomBarController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (isScrollingDown) {
            isScrollingDown = false;
            isOnTop = true;
            showBottomBar();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    scrollBottomBarController.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: widget.fit,
      alignment: widget.alignment,
      children: [
        BottomBarScrollControllerProvider(
          scrollController: scrollBottomBarController,
          child: widget.body(context , scrollBottomBarController),
        ),
        if (widget.showIcon)
          Positioned(
            bottom: widget.bottom,
            child: AnimatedContainer(
              duration: widget.duration,
              curve: widget.curve,
              width: isOnTop == true ? 0 : widget.iconWidth,
              height: isOnTop == true ? 0 : widget.iconHeight,
              decoration: BoxDecoration(
                color: widget.barColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      scrollBottomBarController
                          .animateTo(
                        (!widget.scrollOpposite)
                            ? scrollBottomBarController.position.minScrollExtent
                            : scrollBottomBarController
                            .position.maxScrollExtent,
                        duration: widget.duration,
                        curve: widget.curve,
                      )
                          .then((value) {
                        if (mounted) {
                          setState(() {
                            isOnTop = true;
                            isScrollingDown = false;
                          });
                        }
                        showBottomBar();
                      });
                    },
                    child: widget.icon,
                  ),
                ),
              ),
            ),
          ),
        Positioned(
          bottom: widget.bottom,
          child: SlideTransition(
            position: _offsetAnimation,
            child: ClipRRect(
              borderRadius: widget.borderRadius,
              child: Container(
                  width: widget.width,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: widget.barColor,
                    borderRadius: widget.borderRadius,
                   /* boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.red,
                                    blurRadius: 1,
                                  )
                    ],*/
                  ),
                  child: Material(
                    elevation: 5,
                    //shadowColor: Colors.black,
                    borderRadius: widget.borderRadius,
                    color: widget.barColor,
                    child: widget.child,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
