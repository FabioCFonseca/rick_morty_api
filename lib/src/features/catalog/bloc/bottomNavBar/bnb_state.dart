part of 'bnb_bloc.dart';

abstract class BnbState {
  int currentPage;

  BnbState({required this.currentPage});
}

class BnbInitialState extends BnbState {
  BnbInitialState({required super.currentPage});
}
