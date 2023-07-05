
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/edit_profile/edit_profile_controller.dart';
import 'package:getx_practice/utils/string_resources.dart';

import '../../utils/asset_resources.dart';

PreferredSizeWidget editProfileAppbar() => AppBar(
  centerTitle: true,
  title: const Text(StringResources.editProfileText),
);



Widget textFieldName() => GetBuilder<EditProfileController>(
    builder: (controller) => TextField(
      controller: controller.name,
      decoration: InputDecoration(
        label: const Text(StringResources.nameText),
        prefixIcon: const Icon(IconResources.nameIocn),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));

Widget textFieldUserName() => GetBuilder<EditProfileController>(
    builder: (controller) => TextField(
      controller: controller.email,
      decoration: InputDecoration(
        label: const Text(StringResources.emailText),
        prefixIcon: const Icon(IconResources.accountIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));

Widget textFieldMobileNo() => GetBuilder<EditProfileController>(
    builder: (controller) => TextField(
      controller: controller.number,
      decoration: InputDecoration(  label: const Text(StringResources.mobileNoText),
        prefixIcon: const Icon(IconResources.mobileNoIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));

Widget editProfileButton() => GetBuilder<EditProfileController>(
  builder: (controller) => ElevatedButton(
    onPressed:()=> controller.onPressedEditProfile(),
    child: const Text(StringResources.editProfileText),
  ),
);
