import 'package:store_app_tharwat_samy/helper/api.dart';
import 'package:store_app_tharwat_samy/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct({ProductModel? model}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products?=', body: {
      'title': model!.title,
      'price': model.price,
      'description': model.description,
      'category': model.category,
      'image': model.image
    });
    return ProductModel.fromJson(data);
  }
}
