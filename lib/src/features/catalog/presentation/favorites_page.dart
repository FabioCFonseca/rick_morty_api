import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/catalog_controller.dart';
import '../infrastructure/catalog_repository.dart';
import 'ui/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = Get.put<CatalogController>(
      CatalogController(CatalogRepository()),
    );
    return Column(
      children: [
        Text('Favorites'),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: CustomCard(
              selectedList: controller.favorites,
              favorites: controller.favorites,
              toggleFunction: controller.toggleFavorite),
        )
      ],
    );
  }
}
