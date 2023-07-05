import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_practice/services/internet_connection.dart';

class FirebaseService {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<bool> addDataFirebase(String addKey, dynamic value) async {
    bool checkInternetConnection =
        await InternetConnection.checkInternetConnection();
    bool isAddData = false;

    if (checkInternetConnection) {
      try {
        String? keyRef = database.ref(addKey).push().key;

        addKey = '$addKey/$keyRef';
        if (kDebugMode) {
          print(addKey);
        }
        DatabaseReference reference = database.ref(addKey);

        await reference.set(value).then((value) {
          isAddData = true;
        });
      } on PlatformException catch (error, stackTrace) {
        isAddData = false;

        Get.snackbar('signUp Error', error.message!);
      } catch (e) {
        Get.snackbar('signUp Error', '$e');
        isAddData = false;
      }
    } else {
      Get.snackbar('your internet is off', 'please check internet activity');
    }
    return isAddData;
  }

  static Future<Map?> getAllDataFromFirebase(String key) async {
    Map? allData;
    bool checkInternetConnection =
        await InternetConnection.checkInternetConnection();
    if (checkInternetConnection) {
      try {
        DatabaseReference reference = database.ref(key);
        await reference.get().then(
          (value) {
            allData = value.value as Map;
          },
        );
      } on PlatformException catch (error, stackTrace) {
        Get.snackbar('Data Error', error.message!);
      } catch (e) {
        Get.snackbar('Data Error', '$e');
      }
    } else {
      Get.snackbar('Please check internet activity', 'your internet is off',);
    }
    return allData;
  }
}
