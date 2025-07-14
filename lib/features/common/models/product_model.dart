class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photoUrls;
  final List<Map<String, dynamic>> categories;
  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrls,
    required this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<String> l = [];
    for (String s in jsonData['photos']) {
      l.add(s);
    }

    List<Map<String, dynamic>> cats = List<Map<String, dynamic>>.from(
      jsonData['categories'].map((e) => Map<String, dynamic>.from(e)),
    );

    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      photoUrls: l,
      categories: cats,
    );
  }
}
