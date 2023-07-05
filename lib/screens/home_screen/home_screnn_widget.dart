import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/home_screen/home_screen_controller.dart';
import 'package:getx_practice/utils/asset_resources.dart';

import '../../utils/string_resources.dart';

PreferredSizeWidget homeAppbar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueGrey.shade700,
      title: const Text(StringResources.homeAppbarText),
      actions: [
        GetBuilder<HomeScreenController>(
          builder: (controller) => IconButton(
            onPressed: controller.onPressedAddAccountButton,
            icon: const Icon(IconResources.addAccountIcon),
          ),
        ),
        GetBuilder<HomeScreenController>(
          builder: (controller) => IconButton(
            onPressed: () => controller.onPressedLogOutButton(),
            icon: const Icon(IconResources.logOutIcon),
          ),
        ),
      ],
    );

Widget profile() {
  return GetBuilder<HomeScreenController>(
    id: 'loginUser',
    builder: (controller) => Card(
      color: Colors.blueGrey.shade200,
      shape:const  OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: SizedBox(
        height: Get.height / 5,
        width: Get.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.profileImage != null
                ? Container(
                    height: 100,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          controller.profileImage!,
                        ),
                      ),
                      shape: BoxShape.circle,
                      color: Colors.blueGrey.shade200,
                    ),
                    child: GestureDetector(
                      onTap: () => controller.onTapSelectImage(),
                    ),
                  )
                : GestureDetector(
                    onTap: () => controller.onTapSelectImage(),
                    child: CircleAvatar(
                      radius: 50,
                      child: Center(
                        child: Text(
                          controller.loginUser!.name![0].capitalize.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
            Text(controller.loginUser!.name.toString()),
            Text(
              controller.loginUser!.email.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget showData() {
  return Expanded(
    child: GetBuilder<HomeScreenController>(
      id: 'allUserList',
      builder: (controller) => ListView.builder(
        itemCount: controller.allUserList!.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () => controller.onLongPressedDeleteAccount(index),
          child: Card(
            elevation: 10,
            color: Colors.blueGrey.shade200,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  controller.allUserList![index].name![0].capitalize.toString(),
                ),
              ),
              title: Text(
                controller.allUserList![index].email.toString(),
              ),
              subtitle: Text(
                controller.allUserList![index].name.toString(),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget drawerHomeScreen() {
  return GetBuilder<HomeScreenController>(
    id: 'alignDrawer',
    builder: (controller) => Drawer(
      backgroundColor: Colors.blueGrey.shade700,
      child: Column(
        children: [
          SizedBox(height: 30),
          profile(),
          TextButton(
            onPressed: () =>
                Get.find<HomeScreenController>().onPressedEditProfile(),
            child: Text(
              StringResources.tapToEditProfileText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey.shade200,
              ),
            ),
          ),
          TextButton(
            onPressed: () => controller.onPressedAddAccount(),
            child: Text(
              'Add Account',
              style: TextStyle(
                color: Colors.blueGrey.shade200,
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            onPressed: () => controller.onTapViewProduct(),
            child: Text(
              'Products',
              style: TextStyle(
                color: Colors.blueGrey.shade200,
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () => controller.onPressedLogOutButton(),
            child: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}
