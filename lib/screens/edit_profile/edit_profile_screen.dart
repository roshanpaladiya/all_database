import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/edit_profile/edit_profile_controller.dart';

import '../../common/common_other_widget.dart';
import 'edit_profile_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(EditProfileController());
    return Scaffold(
      appBar: editProfileAppbar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          textFieldName(),
          sizedBoxHeight(20),
          textFieldUserName(),
          sizedBoxHeight(20),
          textFieldMobileNo(),
          sizedBoxHeight(20),
          editProfileButton(),
          sizedBoxHeight(20),
        ],
      )),
    );
  }
}
