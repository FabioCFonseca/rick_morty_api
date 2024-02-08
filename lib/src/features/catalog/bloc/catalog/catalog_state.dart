part of 'catalog_bloc.dart';

abstract class CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogErrorState extends CatalogState {}

class CatalogSuccessState extends CatalogState {
  final List<CatalogModel> catalog;
  CatalogSuccessState({required this.catalog});
}
