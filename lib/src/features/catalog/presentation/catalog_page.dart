import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_getx/src/features/catalog/presentation/ui/catalog_success.dart';

import '../application/catalog_controller.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = Get.find<CatalogController>();

    return Scaffold(
      body: Obx(() {
        if (controller.status.value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.status.value.isError) {
          return Center(
            child: Text(controller.apiError.errorMessage),
          );
        } else {  
          return const CatalogSuccess();
        }
      }),
    );
  }
}
