import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/features/favorites/model/favorites_model.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitialState(favorites: [])) {
    on<FavoritesAddCharacterEvent>(favoritesAddCharacterEvent);
    on<FavoritesRemoveCharacterEvent>(favoritesRemoveCharacterEvent);
  }

  FutureOr<void> favoritesAddCharacterEvent(
      FavoritesAddCharacterEvent event, Emitter<FavoritesState> emit) {
    if (state.favorites.contains(event.character)) {
      state.favorites.remove(event.character);
    } else {
      state.favorites.add(event.character);
    }
    emit(FavoritesUpdatedState(favorites: state.favorites));
    print(state.favorites);
  }

  FutureOr<void> favoritesRemoveCharacterEvent(
      FavoritesRemoveCharacterEvent event, Emitter<FavoritesState> emit) {
    state.favorites.remove(event.character);
    emit(FavoritesUpdatedState(favorites: state.favorites));
  }
}
