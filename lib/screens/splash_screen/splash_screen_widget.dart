import 'package:flutter/material.dart';
import 'package:getx_practice/utils/string_resources.dart';

AppBar appbarSplashScreen() {
  return AppBar(
    centerTitle: true,
    title: const Text(StringResources.splashScreenText),
  );
}
