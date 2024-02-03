import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/character_list_provider.dart';
import 'ui/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterListProvider>(context);

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'List of Characters',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: provider.favoriteCharacters.length,
              itemBuilder: (context, index) {
                bool isFavorite = provider.favoriteCharacters
                    .contains(provider.favoriteCharacters[index]);
                return CustomCard(
                   isFavorite: isFavorite,
                   selectedList: provider.favoriteCharacters,
                   index: index,                    
                );
              }),
        )
      ],
    );
  }
}
