import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  List<ProductModel> _productModelList = [];

  List<ProductModel> get productModelList => _productModelList;
  //actual method
  Future<bool> getPopularProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.allProductsUrl,
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> product
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(product));
      }

      List<ProductModel> popularProducts =
          list.where((product) {
            // Ensure categories is a list of maps
            final List categories = product.categories;

            return categories.any(
              (cat) => cat is Map<String, dynamic> && cat['slug'] == 'popular',
            );
          }).toList();

      _productModelList = popularProducts;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
