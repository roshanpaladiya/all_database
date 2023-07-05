import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/home_screen/home_screen_controller.dart';

import '../../modelClass/modelclass_datal.dart';
import '../../services/preference_service.dart';
import '../../utils/firebase_resourses.dart';
import '../../utils/preference_resources.dart';

class EditProfileController extends GetxController {
  TextEditingController name = TextEditingController(
      text: Get.find<HomeScreenController>().loginUser!.name);
  TextEditingController email = TextEditingController(
      text: Get.find<HomeScreenController>().loginUser!.email);
  TextEditingController number = TextEditingController(
      text: Get.find<HomeScreenController>().loginUser!.number);

  HomeScreenController homeScreenController = HomeScreenController();

  Future<void> onPressedEditProfile() async {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        number.text.isNotEmpty) {
      Map<String, dynamic> editUser = {
        'name': name.text,
        'email': email.text,
        'number': number.text
      };
      DatabaseReference reference = FirebaseDatabase.instance
          .ref(FirebaseResources.allSignUpUsersFirebaseKey);

      reference
          .child(
            PreferenceServices.getString(PreferenceResources.loginUserKey),
          )
          .update(editUser);
      update(['loginUser','allUserList']);

      Get.back();
      print('its working');
    } else {
      Get.snackbar('enter valid details', 'your details are not valid');
    }
  }
}
