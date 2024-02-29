// ignore_for_file: unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/features/favorites/model/favorites_model.dart';
import 'package:rick_morty_bloc/src/utils/user_preferences.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitialState(favorites: [])) {
    on<FavoritesAddCharacterEvent>(favoritesAddCharacterEvent);
  }

  FutureOr<void> favoritesAddCharacterEvent(
      FavoritesAddCharacterEvent event, Emitter<FavoritesState> emit) {
    if (state.favorites.contains(event.character)) {
      state.favorites.remove(event.character);
      UserPreferences.removeFavoriteCharactersToSharedPrefs(
          '${event.character.id.toString()}');
    } else {
      state.favorites.add(event.character);
      UserPreferences.saveFavoriteCharactersToSharedPrefs(
          '${event.character.id}');
    }
    emit(FavoritesUpdatedState(favorites: state.favorites));
  }
}
