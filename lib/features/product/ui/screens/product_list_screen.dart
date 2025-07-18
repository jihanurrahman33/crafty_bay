import 'package:crafty_bay/core/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/product/controllers/product_list_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});
  final CategoryModel category;

  static final String name = '/product-list';
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListCategoryController _productListCategoryController =
      ProductListCategoryController();
  @override
  void initState() {
    _productListCategoryController.getProductList(widget.category.id);
    _scrollController.addListener(_loadMoreData);

    super.initState();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<ProductListCategoryController>().getProductList(
        widget.category.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: GetBuilder(
        init: _productListCategoryController,
        builder: (controller) {
          if (controller.initialLoadingInProgress) {
            return CenteredCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: controller.productModelList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCard(
                          productModel: controller.productModelList[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: controller.inProgress,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
