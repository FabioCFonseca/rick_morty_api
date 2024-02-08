part of 'details_bloc.dart';

abstract class DetailsEvent {}

class DetailsInitialFetchEvent extends DetailsEvent {
  final int characterIndex;

  DetailsInitialFetchEvent({required this.characterIndex});
}
