import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/character_list_provider.dart';
import 'custom_card.dart';

class CharactersSuccess extends StatelessWidget {
  const CharactersSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterListProvider>(context);

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          'List of Characters',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: provider.characters.length,
              itemBuilder: (context, index) {
                bool isFavorite = provider.favoriteCharacters
                        .contains(provider.characters[index]);
                return CustomCard(
                  isFavorite: isFavorite,
                  selectedList: provider.characters,
                  index: index,
                );
              }),
        )
      ],
    );
  }
}
