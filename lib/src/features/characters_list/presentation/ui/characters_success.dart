import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/character_list_provider.dart';
import 'custom_card.dart';

class CharactersSuccess extends StatelessWidget {
  const CharactersSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<CharacterListProvider>(
      builder: (context, provider, child) {
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
              child: screenWidth > 720
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 350,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: provider.characters.length,
                      itemBuilder: (context, index) {
                        bool isFavorite = provider.favoriteCharacters
                            .contains(provider.characters[index]);
                        return CustomCard(
                          isFavorite: isFavorite,
                          selectedList: provider.characters,
                          index: index,
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: provider.characters.length,
                      itemBuilder: (context, index) {
                        bool isFavorite = provider.favoriteCharacters
                            .contains(provider.characters[index]);
                        return CustomCard(
                          isFavorite: isFavorite,
                          selectedList: provider.characters,
                          index: index,
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
