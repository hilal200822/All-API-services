import 'package:store_app_tharwat_samy/helper/api.dart';
import 'package:store_app_tharwat_samy/models/product_model.dart';

class UpdateProductServes {
  Future<ProductModel> updateProduct({
    required ProductModel model,
  }) async {
    final response = await Api().put(
      url: 'https://fakestoreapi.com/products/${model.id.toString()}',
      body: {
        'id': model.id,
        'title': model.title,
        'price': model.price,
        'description': model.description,
        'category': model.category,
        'image': model.image,
      },
    );

    if (response == null) {
      return Future.error('PUT request failed or returned null.');
    } else {
      print(
          '✅ PUT succeeded.succeeded. succeeded. succeeded.  Response: $response');
    }

    return ProductModel.fromJson(response);
  }
}
