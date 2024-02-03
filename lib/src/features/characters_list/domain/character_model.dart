// ignore_for_file: hash_and_equals

class CharacterModel {
  final int id;
  final String name;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  String toString() => 'Character name: $name';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterModel) return false;
    return name == other.name && image == other.image;
  }
}
