import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/getData/getDataFromFirebase.dart';

import 'package:getx_practice/modelClass/modelclass_datal.dart';
import 'package:getx_practice/screens/home_screen/home_screen.dart';
import 'package:getx_practice/screens/sign_up_screen/sign_screen.dart';
import 'package:getx_practice/services/preference_service.dart';
import 'package:getx_practice/utils/preference_resources.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  List<User>? allUserList = [];
  List<User>? userList = [];
  String? loginUserKey ='';

  bool checkUser = false;

  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getData() async {
    allUserList = await GetDataFromFirebase.getAllSignUpUserFromFirebase();
  }

  void onPressedLogin() {
    checkUser = allUserList!.any(
      (element) =>
          element.email == emailLogin.text &&
          element.password == passwordLogin.text,
    );
    int loginUserIndex = allUserList!.indexWhere((element) =>
    element.email == emailLogin.text &&
        element.password == passwordLogin.text);

    if (checkUser) {
      PreferenceServices.setValue(PreferenceResources.isSignUp, true);
      PreferenceServices.setValue(PreferenceResources.loginUserKey, allUserList![loginUserIndex].id);
     loginUserKey = allUserList![loginUserIndex].id;

      Get.off(() => const HomeScreen());
    } else {
      Get.snackbar('Error', 'CHECk your EMAIL or PASSWORD Wrong');
    }
  }

  Future<void> checkData() async {}

  // String loginUserString =
  //     PreferenceServices.getString(PreferenceResources.signUpUserList);
  // if (loginUserString == '') {
  //   Get.snackbar('Please Sign Up ', 'press Sign Up Button to Go Sign Up ID');
  // } else {
  //   List<User> userList = userFromJson(loginUserString);
  //   bool isLogin = userList.any(
  //     (element) =>
  //         element.email == emailLogin.text &&
  //         element.password == passwordLogin.text,
  //   );
  //
  //   if (isLogin == true) {
  //     int loginUserIndex = userList.indexWhere(
  //       (element) =>
  //           element.email == emailLogin.text &&
  //           element.password == passwordLogin.text,
  //     );
  //     User loginUser = userList[loginUserIndex];
  //     PreferenceServices.setValue(
  //       PreferenceResources.loginUser,
  //       json.encode(
  //         loginUser.toJson(),
  //       ),
  //     );
  //     PreferenceServices.setValue(PreferenceResources.isSignUp, true);
  //     //loginUser.id= userList.length;
  //     Get.off(const HomeScreen());
  //   } else {
  //     Get.snackbar('Error', 'CHECk your EMAIL or PASSWORD Wrong');
  //   }
  // }

  void signUponPressed() {
    Get.to(const SignUpScreen())!.then((value) {getData();});
  }
}
