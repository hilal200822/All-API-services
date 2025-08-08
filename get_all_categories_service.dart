import 'dart:convert';
import 'package:http/http.dart';
import 'package:store_app_tharwat_samy/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
