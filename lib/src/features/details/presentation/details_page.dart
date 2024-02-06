import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../injection_container.dart';
import '../application/details_controller.dart';
import '../domain/i_details_repository.dart';
import 'ui/details_success.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.selectedCharacter});

  final int selectedCharacter;

  Widget build(BuildContext context) {
    final DetailsController controller = DetailsController(
        repository: sl.get<IDetailsRepository>(), index: selectedCharacter);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          );
        }),
        toolbarHeight: 62,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CachedNetworkImage(
            imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 50,
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (controller.status == DetailsFetchState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.status == DetailsFetchState.error) {
            return Center(
              child: Text(controller.apiError),
            );
          } else {
            return CharacterDetailsSuccess(character: controller.details!);
          }
        },
      ),
    );
  }
}
