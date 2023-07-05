import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/asset_resources.dart';
import '../../utils/string_resources.dart';
import 'sign_up_screen_controller.dart';

PreferredSizeWidget signUpAppbar() => AppBar(
  centerTitle: true,
      title: const Text(StringResources.signUpAppbarText),
    );

Widget textFieldName() => GetBuilder<SignUpScreenController>(
    builder: (controller) => TextField(
          controller: controller.nameSignUp,
          decoration: InputDecoration(
            label: const Text(StringResources.nameText),
            prefixIcon: const Icon(IconResources.nameIocn),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ));

Widget textFieldUserName() => GetBuilder<SignUpScreenController>(
    builder: (controller) => TextField(
          controller: controller.emailSignUp,
          decoration: InputDecoration(
            label: const Text(StringResources.emailText),
            prefixIcon: const Icon(IconResources.accountIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ));

Widget textFieldPassword() => GetBuilder<SignUpScreenController>(
    builder: (controller) => TextField(
          controller: controller.passwordSignUp,
          decoration: InputDecoration(
            label: const Text(StringResources.passwordText),
            prefixIcon: const Icon(IconResources.passwordIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ));

Widget textFieldMobileNo() => GetBuilder<SignUpScreenController>(
    builder: (controller) => TextField(
          controller: controller.numberSignUp,
          maxLength: 10,

          keyboardType: TextInputType.number,
          decoration: InputDecoration(  label: const Text(StringResources.mobileNoText),
            prefixIcon: const Icon(IconResources.mobileNoIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ));

Widget signUpButton() => GetBuilder<SignUpScreenController>(
      builder: (controller) => ElevatedButton(
        onPressed: controller.onPressedSignUpAddData,
        child: const Text(StringResources.signUpButtonText),
      ),
    );
