import 'package:flutter_bloc/flutter_bloc.dart';

part 'bnb_event.dart';
part 'bnb_state.dart';

class BnbBloc extends Bloc<BnbEvent, BnbState> {
  BnbBloc() : super(BnbInitialState(currentPage: 0)) {
    on<PageChange>(
        (event, emit) => emit(BnbInitialState(currentPage: event.currentPage)));
  }
}
