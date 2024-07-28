// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  String? id;
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String? description;

  Item({
    required this.itemName,
    required this.imgUrl,
    required this.unit,
    required this.price,
    this.description,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'itemName': itemName,
      'imgUrl': imgUrl,
      'unit': unit,
      'price': price,
      'description': description,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] != null ? map['id'] as String : null,
      itemName: map['name'] as String,
      imgUrl: map['image'] as String,
      unit: map['unit'] as String,
      price: (map['price'] as num).toDouble(),
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
