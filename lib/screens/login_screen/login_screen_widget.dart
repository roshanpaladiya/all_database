import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/login_screen/login_screen_contoller.dart';
import 'package:getx_practice/utils/asset_resources.dart';

import '../../utils/string_resources.dart';

PreferredSizeWidget loginAppbar() => AppBar(
      centerTitle: true,
      title: const Text(StringResources.loginAppbarText),
    );

Widget textFieldEmail() => GetBuilder<LoginScreenController>(
      builder: (controller) => TextField(
        controller: controller.emailLogin,
        decoration: InputDecoration(
          label: const Text(StringResources.emailText),
          prefixIcon: const Icon(IconResources.accountIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );

Widget textFieldPassword() => GetBuilder<LoginScreenController>(
      builder: (controller) => TextField(
        controller: controller.passwordLogin,
        decoration: InputDecoration(
          label: const Text(StringResources.passwordText),
          prefixIcon: const Icon(IconResources.passwordIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );

Widget loginButton() => GetBuilder<LoginScreenController>(
      builder: (controller) => ElevatedButton(
        onPressed: controller.onPressedLogin,
        child: const Text(StringResources.loginButtonText),
      ),
    );

Widget signUpButton() => GetBuilder<LoginScreenController>(
      builder: (controller) => ElevatedButton(
        onPressed: controller.signUponPressed,
        child: const Text(StringResources.signUpButtonText),
      ),
    );
