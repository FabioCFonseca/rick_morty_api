import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/details.dart';
import '../infrastructure/details_repository.dart';
part 'details_events.dart';
part 'details_states.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsRepository repository;

  // Initial state of the bloc
  DetailsBloc({required this.repository}) : super(DetailsLoadingState()) {
    // Events handlers, listens to events and call the subsequents functions
    on<DetailsInitialFetchEvent>(detailsInitialFetchEvent);
  }

  // Catalog fetch and folding function
  FutureOr<void> detailsInitialFetchEvent(
      DetailsInitialFetchEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoadingState());
    final result = await repository.getDetails(event.characterIndex);

    result.fold((error) => emit(DetailsErrorState()), (success) {
      emit(DetailsSuccessState(characterDetail: success));
    });
  }
}
