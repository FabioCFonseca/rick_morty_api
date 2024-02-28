part of 'favorites_bloc.dart';

abstract class FavoritesState {
  List<FavoritesModel> favorites = [];

  FavoritesState({required this.favorites});
}

class FavoritesInitialState extends FavoritesState {
  FavoritesInitialState({required List<FavoritesModel> favorites})
      : super(favorites: favorites);
}

class FavoritesUpdatedState extends FavoritesState {
  FavoritesUpdatedState({required List<FavoritesModel> favorites})
      : super(favorites: favorites);
}
