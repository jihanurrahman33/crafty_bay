import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/common/ui/widgets/color_picker.dart';
import 'package:crafty_bay/features/common/ui/widgets/size_picker.dart';
import 'package:crafty_bay/features/product/ui/screens/product_reviews_screen.dart';
import 'package:crafty_bay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Nike 1205kMS - new Shoe 2025',
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
                                Icon(Icons.star, size: 18, color: Colors.amber),
                                Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ProductReviewsScreen.name);
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

                        Text(
                          'Colors',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        ColorPicker(
                          colors: ['Black', 'Blue', 'Pink', 'White', 'Yellow'],
                          onSelected: (String value) {},
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Size',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizePicker(
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                          onSelected: (String value) {},
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione doloremque animi deleniti dolores sunt ea illo laboriosam fuga voluptates, excepturi sequi sint ipsa optio saepe beatae consequuntur. Porro, quisquam cumque.''',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildPriceAndAddToCartSection(context),
        ],
      ),
    );
  }

  Container buildPriceAndAddToCartSection(BuildContext context) {
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
                '${Constants.takaSign}100',
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
            child: ElevatedButton(onPressed: () {}, child: Text('Add to Cart')),
          ),
        ],
      ),
    );
  }
}
