import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/product_screen/product_screen_controller.dart';

AppBar appbar = AppBar(
  centerTitle: true,
  title: const Text('Product Get Api'),
);

Widget body = GetBuilder<ProductScreenController>(
  id: 'itsWork',
  builder: (controller) => controller.isLoad
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SizedBox(
          height: Get.height,
          width: Get.width,
          child: GridView.builder(
            itemCount: controller.productList!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    controller.productList![index].image!,
                  ),
                ),
              ),
            ),
          ),
        ),
);
