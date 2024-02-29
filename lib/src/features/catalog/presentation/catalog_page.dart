import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rick_morty_getx/src/common/presentation/loading.dart';
import 'package:rick_morty_getx/src/features/catalog/presentation/ui/catalog_success.dart';

import '../application/catalog_controller.dart';

class CatalogPage extends GetWidget<CatalogController> {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status.value.isLoading) {
        return const LoadingIndicator();
      } else if (controller.status.value.isSuccess) {
        return const CatalogSuccess();
      } else {
        return Center(
          child: Text(controller.apiError.errorMessage),
        );
      }
    });
  }
}
