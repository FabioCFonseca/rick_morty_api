// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_flutter/src/features/characters_list/domain/character_model.dart';
import 'package:rick_morty_flutter/src/features/characters_list/provider/character_list_provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterListProvider>(
      builder: (context, provider, child) => Card(
        margin: const EdgeInsets.all(35),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  width: 150,
                  height: 150,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                character.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        provider.goToDetails(context, character.id),
                    child: Text(
                      'Details',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => provider.toggleFavorite(character),
                    child: Icon(
                      provider.favoriteCharacters.contains(character)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Color(0xffA333C8),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}