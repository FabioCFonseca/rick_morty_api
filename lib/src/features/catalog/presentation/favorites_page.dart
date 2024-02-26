import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/catalog_controller.dart';
import 'ui/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = Get.find<CatalogController>();

    return Obx(() {
      final screenWidth = MediaQuery.of(context).size.width;

      return controller.favorites.isEmpty
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
                          itemCount: controller.favorites.length,
                          itemBuilder: (context, index) {
                            return CustomCard(
                              character: controller.favorites[index],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: controller.favorites.length,
                          itemBuilder: (context, index) {
                            return CustomCard(
                              character: controller.favorites[index],
                            );
                          },
                        ),
                ),
              ],
            );
    });
  }
}
