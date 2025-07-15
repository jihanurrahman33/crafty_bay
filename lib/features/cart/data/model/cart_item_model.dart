import 'package:crafty_bay/features/common/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel productModel;
  final String? color;
  final String? size;
  int quantity;

  CartItemModel({
    required this.id,
    required this.productModel,
    required this.color,
    required this.size,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
      id: jsonData['_id'],
      productModel: ProductModel.fromJson(jsonData['product']),
      color: jsonData['colors'],
      size: jsonData['sizes'],
      quantity: jsonData['quantity'],
    );
  }
}
