import 'package:dartz/dartz.dart';

import 'catalog.dart';

abstract class ICatalogRepository {
  Future<Either<Exception, List<CatalogModel>>> getCatalog();
}
