import 'package:flutter/material.dart';

//Master page
class MainPage extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const MainPage({Key? key,required this.body, this.appBar, this.scaffoldKey,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: body
    );
  }
}
