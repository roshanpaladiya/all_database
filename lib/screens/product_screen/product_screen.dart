import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/product_screen/product_screen_controller.dart';
import 'package:getx_practice/screens/product_screen/product_screen_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductScreenController());
    return Scaffold(
      appBar:appbar,
      body: body,
    );
  }
}
