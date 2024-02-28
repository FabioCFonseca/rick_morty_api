import 'package:dartz/dartz.dart';

import 'package:rick_morty_bloc/src/common/domain/app_error.dart';
import 'package:rick_morty_bloc/src/features/catalog/domain/catalog_model.dart';

// Interface para abstrair a implementação do repositório/API da camada de domínio
abstract class ICatalogRepository {
  Future<Either<AppError, List<CatalogModel>>> getCatalog();
}
