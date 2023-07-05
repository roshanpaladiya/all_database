import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetConnection {
  static Future<bool> checkInternetConnection() async {
    bool checkConnection = false;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        checkConnection = true;
      }
    } on SocketException catch (e) {
      checkConnection = false;
      Get.snackbar(
        'Connection Error',
        'Turn on Your Internet',
        backgroundColor: Colors.red,
      );
    }

    return checkConnection;
  }
}
