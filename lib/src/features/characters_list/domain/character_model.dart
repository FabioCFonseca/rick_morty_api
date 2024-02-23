// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: hash_and_equals

// Todos os domínios são iguais nas diferentes soluções de state management
// tanto a interface do repositório quanto o model

// Model criada diretamente no Domain pois os dados serão usados somente para 
// display na UI e não possuem regras de negócio *****

// COLORCAR MODEL NA FOLDER REPOSITORIE? ** DOMAIN/REPOSITORI/I_REPO & MODEL

class CharacterModel {
  final int id;
  final String name;
  final String image;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  String toString() => 'Character name: $name';

  // Método para verificar a equalidade dos objetos para a funcionalidade
  // de toggle nos favoritos
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterModel) return false;
    return name == other.name && image == other.image;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) => CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
