import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:get/get.dart';

class DeleteCartItemController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  Future<bool> deleteCartItem(String cartItemId) async {
    _inProgress = true;
    update();

    final url = Urls.deleteCartItemUrl(cartItemId);

    NetworkResponse response = await Get.find<NetworkClient>().deleteRequest(
      url,
    );

    _inProgress = false;
    update();

    if (response.isSuccess) {
      _errorMessage = null;
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Unknown error';
      return false;
    }
  }
}
