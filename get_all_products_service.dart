import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app_tharwat_samy/helper/api.dart';
import 'package:store_app_tharwat_samy/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
