import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/edit_profile/edit_profile_screen.dart';
import 'package:getx_practice/screens/home_screen/home_screen_controller.dart';
import 'package:getx_practice/screens/home_screen/home_screnn_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      drawer: drawerHomeScreen(),
      appBar: homeAppbar(),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            profile(),
            showData(),
          ],
        ),
      ),
    );
  }
}
