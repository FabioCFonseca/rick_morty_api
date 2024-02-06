import 'package:dartz/dartz.dart';
import 'package:rick_morty_mobx_/src/features/catalog/domain/catalog.dart';

abstract class ICatalogRepository {
  Future<Either<Exception, List<CatalogModel>>> getCatalog();
}
