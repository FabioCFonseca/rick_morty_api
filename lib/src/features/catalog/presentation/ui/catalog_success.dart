import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rick_morty_getx/src/features/catalog/application/catalog_controller.dart';
import 'package:rick_morty_getx/src/features/catalog/presentation/ui/custom_card.dart';

class CatalogSuccess extends StatelessWidget {
  const CatalogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final CatalogController controller = Get.find<CatalogController>();

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
                  itemCount: controller.catalog.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      character: controller.catalog[index],
                    );
                  },
                )
              : ListView.builder(
                  itemCount: controller.catalog.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      character: controller.catalog[index],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
