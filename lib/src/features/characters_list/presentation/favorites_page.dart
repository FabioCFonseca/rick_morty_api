import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_flutter/src/features/characters_list/presentation/ui/custom_card.dart';
import 'package:rick_morty_flutter/src/features/characters_list/provider/character_list_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<CharacterListProvider>(
      builder: (context, provider, child) {
        return provider.favoriteCharacters.isEmpty
            ? Center(
                child: Text(
                  'No favorite characters added',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'List of Characters',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: screenWidth > 720
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 350,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: provider.favoriteCharacters.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                character: provider.favoriteCharacters[index],
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: provider.favoriteCharacters.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                character: provider.favoriteCharacters[index],
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
