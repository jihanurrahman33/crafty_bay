import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/core/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/color_picker.dart';
import 'package:crafty_bay/features/common/ui/widgets/size_picker.dart';
import 'package:crafty_bay/features/product/controllers/product_details_controller.dart';
import 'package:crafty_bay/features/product/data/models/product_details_model.dart';
import 'package:crafty_bay/features/product/ui/screens/product_reviews_screen.dart';
import 'package:crafty_bay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  @override
  void initState() {
    _productDetailsController.getProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (_) {
          if (_productDetailsController.inProgress) {
            return CenteredCircularProgressIndicator();
          }
          if (_productDetailsController.errorMessage != null) {
            return Center(child: Text(_productDetailsController.errorMessage!));
          }
          final ProductDetailsModel product =
              _productDetailsController.productDetails;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(images: product.photoUrls),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.6,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                IncDecButton(onChange: (int value) {}),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      ProductReviewsScreen.name,
                                    );
                                  },
                                  child: Text('Reviews'),
                                ),
                                Card(
                                  color: AppColors.themeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.favorite_outline_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Visibility(
                              visible: product.colors.isNotEmpty,
                              child: Column(
                                children: [
                                  Text(
                                    'Colors',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  ColorPicker(
                                    colors: product.colors,
                                    onSelected: (String value) {},
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),

                            Visibility(
                              visible: product.sizes.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  SizePicker(
                                    sizes: product.sizes,
                                    onSelected: (String value) {},
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              product.description,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildPriceAndAddToCartSection(product),
            ],
          );
        },
      ),
    );
  }

  Widget buildPriceAndAddToCartSection(ProductDetailsModel product) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}${product.currentPrice}',
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
            child: ElevatedButton(
              onPressed: _onTapAddToCartButton,
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCartButton() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      //TODO: Add to Cart
    } else {
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }
}
