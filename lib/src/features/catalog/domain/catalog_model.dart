import 'dart:convert';

import 'package:rick_morty_bloc/src/features/favorites/model/favorites_model.dart';

// ignore_for_file: hash_and_equals

// Todos os domínios são iguais nas diferentes soluções de state management
// tanto a interface do repositório quanto o model permitindo o re uso do código
// devido ao desacoplamento

class CatalogModel extends FavoritesModel {
  const CatalogModel({
    required super.id,
    required super.name,
    required super.image,
  });

  @override
  String toString() => 'Character name: $name';

  // Método para verificar a equalidade dos objetos para a funcionalidade
  // de toggle nos favoritos
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatalogModel) return false;
    return name == other.name && image == other.image;
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
}
