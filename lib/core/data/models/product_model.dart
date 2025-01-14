class ProductModel {
  String name;
  String imgUrl;
  double price;
  double disocuntPrice;
  String productType;
  String skinType;
  String skinProblem;
  String effect;
  String cosmeticsLine;
  bool isDiscount;
  bool isDouble;
  ProductModel({
    required this.isDiscount,
    required this.isDouble,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.disocuntPrice,
    required this.productType,
    required this.skinType,
    required this.skinProblem,
    required this.effect,
    required this.cosmeticsLine,
  });
}
