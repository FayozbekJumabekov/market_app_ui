class Product {
  String name;
  String model;
  String cost;
  String image;
  bool isLiked = false;

  Product(
      {required this.name,
      required this.model,
      required this.image,
      required this.cost,
      required this.isLiked});
}
