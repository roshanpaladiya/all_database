import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/common/common_other_widget.dart';
import 'package:getx_practice/screens/sign_up_screen/sign_up_screen_controller.dart';
import 'package:getx_practice/screens/sign_up_screen/sign_up_screen_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpScreenController());
    return Scaffold(
      appBar: signUpAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            textFieldName(),
            sizedBoxHeight(20),
            textFieldUserName(),
            sizedBoxHeight(20),
            textFieldPassword(),
            sizedBoxHeight(20),
            textFieldMobileNo(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
