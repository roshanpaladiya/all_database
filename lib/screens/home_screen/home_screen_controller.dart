import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/edit_profile/edit_profile_screen.dart';
import 'package:getx_practice/screens/login_screen/login_screen.dart';
import 'package:getx_practice/screens/product_screen/product_screen.dart';
import 'package:getx_practice/screens/sign_up_screen/sign_screen.dart';
import 'package:getx_practice/services/preference_service.dart';
import 'package:getx_practice/utils/color_resources.dart';
import 'package:getx_practice/utils/firebase_resourses.dart';
import 'package:getx_practice/utils/preference_resources.dart';
import 'package:getx_practice/utils/string_resources.dart';
import 'package:image_picker/image_picker.dart';

import '../../getData/getDataFromFirebase.dart';
import '../../modelClass/modelclass_datal.dart';

class HomeScreenController extends GetxController {
  bool alignDrawer = false;
  File? profileImage;

  User? loginUser;
  List<User>? allUserList = [];
  String? loginUserKey = '';

  @override
  void onInit() {
    // getLoginUser();
    //getAllSignUpUsers();
    getLoginUserDataForHomeScreen();

    getAllUserDataForHomeScreen();

    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getLoginUserDataForHomeScreen() async {
    DatabaseReference reference = FirebaseDatabase.instance
        .ref(FirebaseResources.allSignUpUsersFirebaseKey);
    await reference
        .child(PreferenceServices.getString(PreferenceResources.loginUserKey))
        .get()
        .then(
      (value) {
        Map loginUserValue = value.value as Map;
        loginUser = User.fromJson(loginUserValue);
        update(['loginUser']);
      },
    );
  }

  Future<void> getAllUserDataForHomeScreen() async {
    allUserList = await GetDataFromFirebase.getAllSignUpUserFromFirebase();
    allUserList!.removeWhere((element) => element.email == loginUser!.email);

    update(['allUserList']);
  }

  // void getLoginUser() {
  //   String loginUserString =
  //       PreferenceServices.getString(PreferenceResources.loginUser);
  //   loginUser = User.fromJson(json.decode(loginUserString));
  //   update();
  // }
  //
  // void getAllSignUpUsers() {
  //   String allUserListString =
  //       PreferenceServices.getString(PreferenceResources.signUpUserList);
  //   allUserList = userFromJson(allUserListString);
  //   update();
  // }

  void onPressedLogOutButton() {
    Get.dialog(
      SimpleDialog(
        title: const Text(StringResources.logoutText),
        children: [
          TextButton(
            onPressed: onPressedLogOut,
            child: const Text(
              StringResources.logoutText,
              style: TextStyle(color: ColorResources.redColor),
            ),
          ),
          TextButton(
            onPressed: onPressedCancel,
            child: const Text(StringResources.cancelText),
          ),
        ],
      ),
    );
  }

  void onPressedAddAccountButton() {
    Get.dialog(
      SimpleDialog(
        title: const Text(StringResources.addAccountText),
        children: [
          TextButton(
            onPressed: onPressedAddAccount,
            child: const Text(
              StringResources.addAccountText,
              style: TextStyle(color: ColorResources.greenColor),
            ),
          ),
          TextButton(
            onPressed: onPressedCancel,
            child: const Text(StringResources.cancelText),
          ),
        ],
      ),
    );
  }

  void onPressedEditProfile() {
    Get.to(const EditProfileScreen())!.then(
      (value) {
        getAllUserDataForHomeScreen();
        getLoginUserDataForHomeScreen();
      },
    );

    //!.then(
    //   (value) {
    //     if (value != null) {
    //       loginUser = value;
    //       PreferenceServices.setValue(
    //         PreferenceResources.loginUser,
    //         json.encode(
    //           loginUser!.toJson(),
    //         ),
    //       );
    //       int loginUserIndex =
    //           allUserList!.indexWhere((element) => element == loginUser);
    //       allUserList![loginUserIndex] = loginUser!;
    //       String allUserString = userToJson(allUserList!);
    //       PreferenceServices.setValue(
    //           PreferenceResources.signUpUserList, allUserString);
    //     }
    //   },
    // );
  }

  void onLongPressedDeleteAccount(int index) {
    Get.dialog(SimpleDialog(
      title: const Text(
        'Delete user',
        style: TextStyle(color: Colors.red),
      ),
      backgroundColor: Colors.white,
      children: [
        ElevatedButton(
          child: const Text('Delete User From DataBase'),
          onPressed: () => onPressedDeleteUserFromFirebase(index),
        ),
        ElevatedButton(
          onPressed: onPressedCancel,
          child: const Text('Cancel'),
        )
      ],
    ));
  }

  void onPressedDeleteUserFromFirebase(int index) {
    DatabaseReference reference = FirebaseDatabase.instance
        .ref(FirebaseResources.allSignUpUsersFirebaseKey);

    reference.child(allUserList![index].id.toString()).remove().then(
      (value) {
        getAllUserDataForHomeScreen();
      },
    );
    update(['allUserList']);
    Get.back();
  }

  Future<void> onTapSelectImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    profileImage = File(pickedImage!.path);

    update(['loginUser']);
  }

  void onPressedLogOut() {
    PreferenceServices.setValue(PreferenceResources.isSignUp, false);

    Get.offAll(const LoginScreen());
  }

  void onPressedAddAccount() {
    Get.to(const SignUpScreen())!.then((value) {
      getAllUserDataForHomeScreen();
    });
  }

  void onPressedCancel() {
    Get.back();
  }

  void onTapViewProduct() {
    Get.to(() => const ProductScreen());
  }

  void onTapDraerAlign() {
    alignDrawer = !alignDrawer;
    update(['alignDrawer']);
  }
}
