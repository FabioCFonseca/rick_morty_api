import 'package:get_it/get_it.dart';
import 'package:rick_morty_mobx_/src/features/catalog/application/catalog_controller.dart';
import 'package:rick_morty_mobx_/src/features/catalog/domain/i_catalog_repository.dart';
import 'package:rick_morty_mobx_/src/features/catalog/infrastructure/catalog_repository.dart';
import 'package:rick_morty_mobx_/src/features/details/application/details_controller.dart';
import 'package:rick_morty_mobx_/src/features/details/domain/i_details_repository.dart';
import 'package:rick_morty_mobx_/src/features/details/infrastructure/details_repository.dart';


final sl = GetIt.instance;

void initDependencies() async {
  print('Init DI ranned');
  
  // Catalog feature
  sl.registerSingleton<ICatalogRepository>(CatalogRepository());
  // Singleton controller for handling multiple pages
  sl.registerSingleton<CatalogController>(CatalogController(CatalogRepository()));

  // Details feature
  sl.registerSingleton<IDetailsRepository>(DetailsRepository());
  //sl.registerFactory<DetailsController>(() => DetailsController(DetailsRepository()));

}
