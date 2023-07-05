import 'package:getx_practice/services/api_service.dart';
import 'package:getx_practice/utils/api_end_points.dart';
import 'package:http/http.dart' as http;

import '../../modelClass/product_model.dart';

class ProductScreenApi {
 static Future getData() async {
    http.Response? responce = await ApiService.getAPi(url: ApiResources.url);
    try {
      if (responce != null && responce.statusCode == 20) {
        return productModelFromJson(responce.body);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
