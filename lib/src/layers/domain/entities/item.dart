import 'dart:convert';

import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';

class Item {
  String? id;
  String itemName;
  String? imgUrl;
  String? unit;
  double price;
  String? description;
  Category? category;

  Item({
    required this.itemName,
    required this.price,
    this.category,
    this.id,
    this.imgUrl,
    this.unit,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'itemName': itemName,
      'imgUrl': imgUrl,
      'unit': unit,
      'price': price,
      'description': description,
      'category': category?.toMap()
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['objectId'] != null ? map['objectId'] as String : null,
      itemName: map['name'] as String,
      imgUrl: map['image'] != null ? map['image'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
      price: (map['price'] as num).toDouble(),
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null
          ? Category.fromMap(map['category'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
