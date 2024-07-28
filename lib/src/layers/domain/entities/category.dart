import 'dart:convert';

class Category {
  String? objectId;
  String name;

  Category({
    this.objectId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
      name: map['name'] as String,
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
