import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../injection_container.dart';
import '../application/catalog_controller.dart';
import 'ui/custom_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = sl.get<CatalogController>();

    return Scaffold(body: Observer(
      builder: (context) {
        if (controller.status == CatalogState.loading) {
          return Center(child: const CircularProgressIndicator());
        } else if (controller.status == CatalogState.error) {
          return Center(
            child: Text(controller.apiError),
          );
        } else {
          return CustomCard(
            selectedList: controller.catalog,
            favorites: controller.favorites,
            toggleFunction: controller.toggleFavorite,
          );
        }
      },
    ));
  }
}
