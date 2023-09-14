import 'dart:convert';

class Category {
  String name;
  String imageRes;

  Category({
    required this.name,
    required this.imageRes,
  });

  Category copyWith({
    String? name,
    String? imageRes,
  }) {
    return Category(
      name: name ?? this.name,
      imageRes: imageRes ?? this.imageRes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageRes': imageRes,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] ?? '',
      imageRes: map['imageRes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(name: $name, imageRes: $imageRes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.name == name &&
        other.imageRes == imageRes;
  }

  @override
  int get hashCode => name.hashCode ^ imageRes.hashCode;
}
