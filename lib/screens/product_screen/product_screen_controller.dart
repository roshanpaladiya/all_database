import 'package:get/get.dart';
import 'package:getx_practice/modelClass/product_model.dart';
import 'package:getx_practice/screens/product_screen/product_screen_api.dart';

class ProductScreenController extends GetxController {
List<ProductModel>? productList=[] ;
  bool isLoad = false;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    isLoad = false;
    update(['itsWork']);
    productList = await ProductScreenApi.getData();
    isLoad =true;
    update(['itsWork']);
  }
}
