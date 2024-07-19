class Item {
  String? id;
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String? description;
  String? image;

  Item({
    required this.itemName,
    required this.imgUrl,
    required this.unit,
    required this.price,
    this.description,
    this.image,
    this.id,
  });
}
