import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_practice/services/preference_service.dart';
import '../../utils/preference_resources.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    bool isLogin = PreferenceServices.getBool(PreferenceResources.isSignUp);
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        () => isLogin ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
