import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/getData/getDataFromFirebase.dart';
import 'package:getx_practice/modelClass/modelclass_datal.dart';
import 'package:getx_practice/services/firebase_service.dart';
import 'package:getx_practice/utils/firebase_resourses.dart';

class SignUpScreenController extends GetxController {
  TextEditingController nameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController numberSignUp = TextEditingController();

  List<User>? signUpUserList = [];

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  Future<void> getData() async {
    signUpUserList = await GetDataFromFirebase.getAllSignUpUserFromFirebase();
  }

  Future<void> onPressedSignUpAddData() async {
    Map<String, dynamic> signUpUser = {
      'name': nameSignUp.text,
      'email': emailSignUp.text,
      'password': passwordSignUp.text,
      'number': numberSignUp.text,
    };

    bool checkIsValid = signUpUser['email'].toString().isEmail &&
        signUpUser['number'].toString().isPhoneNumber &&
        signUpUser['name'].toString().isNotEmpty &&
        signUpUser['password'].toString().isNotEmpty;
    User signUpUserModel = User.fromJson(signUpUser);
    bool checkValue = signUpUserList!.any(
      (element) => element.email == emailSignUp.text,
    );

    if (checkValue) {
      Get.snackbar('Error', 'User AllReady Exists');
    } else {
      if (checkIsValid) {
        bool isAddData = await FirebaseService.addDataFirebase(
            FirebaseResources.allSignUpUsersFirebaseKey,
            signUpUserModel.toJson());
        if (isAddData == true) {
          nameSignUp.clear();
          emailSignUp.clear();
          passwordSignUp.clear();
          numberSignUp.clear();
          Get.back();
        } else {
          Get.snackbar(
            'signUp ERROR',
            'PLEASE check again',
          );
        }
      } else {
        Get.snackbar('Enter Valid Details', 'Your Email or Phone Number wrong');
      }
    }

    // String signUpUserString =
    //     PreferenceServices.getString(PreferenceResources.signUpUserList);
    // if (signUpUserString == '') {
    //   signUpUserModel.id = 0;
    //
    //   signUpUserList.add(signUpUserModel);
    // } else {
    //   signUpUserList = userFromJson(signUpUserString);
    //   signUpUserModel.id = signUpUserList.length;
    //
    //   signUpUserList.add(signUpUserModel);
    // }
    // signUpUserString = userToJson(signUpUserList);
    // PreferenceServices.setValue(
    //     PreferenceResources.signUpUserList, signUpUserString);
    // update();
  }
}
