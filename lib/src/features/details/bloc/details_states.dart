part of 'details_bloc.dart';

abstract class DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsErrorState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  DetailsModel characterDetail;

  DetailsSuccessState({required this.characterDetail});
}
