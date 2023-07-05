import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/splash_screen/splash_screen_controller.dart';
import 'package:getx_practice/screens/splash_screen/splash_screen_widget.dart';
import 'package:getx_practice/utils/string_resources.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashScreenController myConyroller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSplashScreen(),
      body: Center(
        child: Column(
          children: [
            FlutterLogo(),
            Text(StringResources.splashScreenText),

          ],
        ),
      ),
    );
  }
}
