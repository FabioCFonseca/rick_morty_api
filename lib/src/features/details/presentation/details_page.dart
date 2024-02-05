import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';

import '../application/details_controller.dart';
import '../infrastructure/details_repository.dart';
import 'ui/details_success.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.selectedCharacter});

  int selectedCharacter;

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put<DetailsController>(
      DetailsController(DetailsRepository(), selectedCharacter),
    );
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(FontAwesome.arrow_left),);       
        }),
        toolbarHeight: 62,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CachedNetworkImage(
            imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
            errorWidget: (context, url, error) => Icon(FontAwesome.exclamation_circle),
            height: 50,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.status.value.isLoading) {
          return Center(child: const CircularProgressIndicator());
        } else if (controller.status.value.isError) {
          return Center(
            child: Text(controller.apiError),
          );
        } else {
          return CharacterDetailsSuccess(character: controller.details.value!);
        }
      }),
    );
  }
}
