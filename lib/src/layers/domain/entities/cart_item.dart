import 'dart:convert';

import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

class CartItem {
  String objectId;
  Item item;
  int quantity;

  CartItem({
    required this.objectId,
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'item': item.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      objectId: map['objectId'] as String,
      item: Item.fromMap(map['item'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
