import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_getx/src/common/consts/spacers.dart';
import 'package:rick_morty_getx/src/common/presentation/custom_card.dart';
import 'package:rick_morty_getx/src/features/favorites/application/favorites_controller.dart';


class FavoritesPage extends GetWidget<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Column(
        children: [
          AppSizes.small(),
          Text(
            'List of Favorites Characters',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 350,
                crossAxisCount: screenWidth > 720 ? 2 : 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount:
                  controller.favorites.length, // Access controller directly
              itemBuilder: (context, index) {
                return CustomCard(
                  character: controller.favorites[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
