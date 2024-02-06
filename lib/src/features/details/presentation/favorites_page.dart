import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../catalog/application/catalog_controller.dart';
import '../../catalog/presentation/ui/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = sl.get<CatalogController>();

    return Column(
      children: [
        SizedBox(height: 25,),
        Text('Favorites', style: Theme.of(context).textTheme.displayLarge,),
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
