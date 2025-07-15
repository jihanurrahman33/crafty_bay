import 'package:crafty_bay/core/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/core/ui/widgets/snack_bar_message.dart';
import 'package:crafty_bay/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:crafty_bay/features/cart/ui/controllers/delete_cart_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListController _cartListController = Get.find<CartListController>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartListController.getCartItemList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Cart'),
        ),
        body: GetBuilder<CartListController>(
          init: _cartListController,
          builder: (_) {
            if (_cartListController.inProgress) {
              return CenteredCircularProgressIndicator();
            }
            if (_cartListController.errorMessage != null) {
              return Center(child: Text(_cartListController.errorMessage!));
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      itemCount: _cartListController.cartItemList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          deleteItem: () {
                            Logger().w(
                              _cartListController
                                  .cartItemList[index]
                                  .productModel
                                  .title,
                            );

                            _deleteCartItem(
                              cartItemId:
                                  _cartListController.cartItemList[index].id,
                            );
                          },
                          cartItemModel:
                              _cartListController.cartItemList[index],
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 4),
                    ),
                  ),
                ),
                buildPriceAndCheckoutSection(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Container buildPriceAndCheckoutSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}${_cartListController.totalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCartItem({required String cartItemId}) async {
    bool result = await Get.find<DeleteCartItemController>().deleteCartItem(
      cartItemId,
    );
    if (result) {
      showSnackBarMessage(context, 'Removed from cart');
      _cartListController.getCartItemList();
    } else {
      showSnackBarMessage(context, 'Failed to remove');
    }
  }

  void _backToHome() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
