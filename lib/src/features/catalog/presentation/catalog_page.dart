import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/catalog_controller.dart';
import '../infrastructure/catalog_repository.dart';
import 'ui/custom_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = Get.put<CatalogController>(
      CatalogController(CatalogRepository()),
    );
    return Scaffold(
      body: Obx(() {
        if (controller.status.value.isLoading) {
          return Center(child: const CircularProgressIndicator());
        } else if (controller.status.value.isError) {
          return Center(
            child: Text(controller.apiError),
          );
        } else {
          return CustomCard(
            selectedList: controller.catalog,
            favorites: controller.favorites,
            toggleFunction: controller.toggleFavorite,
          );
        }
      }),
    );
  }
}
