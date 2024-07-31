import 'dart:convert';

import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

class Category {
  String? objectId;
  String name;
  List<Item>? items;

  Category({
    this.objectId,
    this.items,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'name': name,
      'items': items?.map((item) => item.toMap()).toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      objectId: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      items: map['items'] != null
          ? List<Item>.from(
              (map['items'] as List<dynamic>).map<Item>(
                (item) => Item.fromMap(item as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.objectId == objectId &&
        other.name == name;
  }

  @override
  int get hashCode => objectId.hashCode ^ name.hashCode;
}
