part of 'favorites_bloc.dart';

abstract class FavoritesState {
  List<CatalogModel> favorites = [];

  FavoritesState({required this.favorites});
}

class FavoritesInitialState extends FavoritesState {
  FavoritesInitialState({required List<CatalogModel> favorites})
      : super(favorites: favorites);
}

class FavoritesUpdatedState extends FavoritesState {
  FavoritesUpdatedState({required List<CatalogModel> favorites})
      : super(favorites: favorites);
}
