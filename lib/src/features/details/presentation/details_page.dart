import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_getx/src/common/presentation/custom_appbar.dart';
import 'package:rick_morty_getx/src/common/presentation/loading.dart';

import '../application/details_controller.dart';
import '../infrastructure/details_repository.dart';
import 'ui/details_success.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.selectedCharacter});

  final int selectedCharacter;

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put<DetailsController>(
      DetailsController(CharactersDetailsRepository(), selectedCharacter),
    );
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Obx(() {
        if (controller.status.value.isLoading) {
          return const LoadingIndicator();
        } else if (controller.status.value.isError) {
          return Center(
            child: Text(controller.apiError.errorMessage),
          );
        } else {
          return CharacterDetailsSuccess(character: controller.details.value!);
        }
      }),
    );
  }
}