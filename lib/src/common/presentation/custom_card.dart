// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rick_morty_getx/src/features/details/presentation/details_page.dart';
import 'package:rick_morty_getx/src/features/favorites/application/favorites_controller.dart';
import 'package:rick_morty_getx/src/features/favorites/model/favorites_model.dart';

class CustomCard extends GetWidget<FavoritesController> {
  const CustomCard({Key? key, required this.character}) : super(key: key);

  final FavoritesModel character;

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Card(
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
                        Get.to(DetailsPage(
                          selectedCharacter: character.id,
                        )),
                    child: Text(
                      'Details',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toggleFavorite(character),
                    child: Icon(
                      controller.favorites.contains(character)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: const Color(0xffA333C8),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
