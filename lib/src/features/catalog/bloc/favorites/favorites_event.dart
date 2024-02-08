part of 'favorites_bloc.dart';

abstract class FavoritesEvents {}

class FavoritesAddCharacterEvent extends FavoritesEvents {
  final CatalogModel character;

  FavoritesAddCharacterEvent({required this.character});
}

class FavoritesRemoveCharacterEvent extends FavoritesEvents {
  final CatalogModel character;

  FavoritesRemoveCharacterEvent({required this.character});
}
