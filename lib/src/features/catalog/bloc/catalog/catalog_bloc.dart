import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/features/catalog/domain/catalog_model.dart';
import 'package:rick_morty_bloc/src/features/catalog/domain/i_catalog_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ICatalogRepository repository;

  // Initial state of the bloc
  CatalogBloc({required this.repository}) : super(CatalogLoadingState()) {
    // Events handlers, listens to events and call the subsequents functions
    on<CatalogInitialFetchEvent>(catalogInitialFetchEvent);
  }

  // Catalog fetch and folding function
  FutureOr<void> catalogInitialFetchEvent(
      CatalogInitialFetchEvent event, Emitter<CatalogState> emit) async {
    emit(CatalogLoadingState());
    final result = await repository.getCatalog();

    result.fold((error) => emit(CatalogErrorState()), (success) {
      emit(CatalogSuccessState(catalog: success));
    });
  }
}
