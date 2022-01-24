class Product {
  String name;
  String model;
  String cost;
  String image;
  String color;
  bool isLiked = false;


  Product(
      {required this.name,
      required this.model,
      required this.image,
      required this.cost,
      required this.isLiked,
      required this.color});
}
