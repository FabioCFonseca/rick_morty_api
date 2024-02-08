import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rick_morty_bloc/src/features/catalog/domain/catalog.dart';
import 'package:rick_morty_bloc/src/features/catalog/infrastructure/catalog_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  //TODO inject in the constructor?
  CatalogRepository repository = CatalogRepository();

  // Initial state of the bloc
  CatalogBloc() : super(CatalogLoadingState()) {
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
