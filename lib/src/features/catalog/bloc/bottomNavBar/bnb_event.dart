part of 'bnb_bloc.dart';

abstract class BnbEvent {}

class PageChange extends BnbEvent {
  int currentPage;

  PageChange({required this.currentPage});
}
