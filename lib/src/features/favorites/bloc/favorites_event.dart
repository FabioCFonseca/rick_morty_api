part of 'favorites_bloc.dart';

abstract class FavoritesEvents {}

class FavoritesAddCharacterEvent extends FavoritesEvents {
  final FavoritesModel character;

  FavoritesAddCharacterEvent({required this.character});
}
