import 'package:flutter/material.dart';

import '../domain/catalog.dart';
import 'ui/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<CatalogModel> favorites;

  const FavoritesPage({Key? key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          'List of Characters',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  character: favorites[index],
                );
              }),
        )
      ],
    );
  }
}
