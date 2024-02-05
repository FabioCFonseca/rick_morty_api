// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  final int id;
  final String name;
  final String image;

  CatalogModel({
    required this.id,
    required this.name,
    required this.image,
  });

  CatalogModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return CatalogModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CatalogModel.fromMap(Map<String, dynamic> map) {
    return CatalogModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogModel.fromJson(String source) =>
      CatalogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogModel(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant CatalogModel other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
