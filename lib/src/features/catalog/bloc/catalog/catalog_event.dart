part of 'catalog_bloc.dart';

abstract class CatalogEvent {}

class CatalogInitialFetchEvent extends CatalogEvent {}

class CatalogChangeBottomNavbar extends CatalogEvent {}
