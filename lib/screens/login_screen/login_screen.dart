import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/common/common_other_widget.dart';
import 'package:getx_practice/screens/login_screen/login_screen_contoller.dart';
import 'package:getx_practice/screens/login_screen/login_screen_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());

    return Scaffold(
      appBar: loginAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            textFieldEmail(),
            sizedBoxHeight(20),
            textFieldPassword(),
            sizedBoxHeight(20),
            loginButton(),
            sizedBoxHeight(20),
            signUpButton(),



          ],
        ),
      ),
    );
  }
}
