import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_flutter/src/common/presentation/loading.dart';
import 'package:rick_morty_flutter/src/features/character_details/infrastructure/character_details_repository.dart';
import 'package:rick_morty_flutter/src/features/character_details/presentation/ui/character_details_success.dart';
import 'package:rick_morty_flutter/src/features/character_details/provider/character_details_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.selectedCharacter});

  final int selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CharacterDetailsProvider>(
      create: (context) => CharacterDetailsProvider(
        selectedCharacter: selectedCharacter,
        repository: CharactersDetailsRepository(),
      )..controllerStart(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            // Check se app está no browser
            child: kIsWeb
                ? Image.asset(
                    'assets/logo.png',
                    height: 70,
                  )
                : CachedNetworkImage(
                    imageUrl:
                        'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 70,
                  ),
          ),
        ),
        body: Consumer<CharacterDetailsProvider>(
          builder: (context, characterDetailsProvider, child) {
            Widget bodyWidget;
            switch (characterDetailsProvider.providerStatus) {
              case CharacterDetailsProviderState.loading:
                bodyWidget = LoadingInidicator();
              case CharacterDetailsProviderState.success:
                bodyWidget = CharacterDetailsSuccess();
              default:
                bodyWidget = Center(
                  child: Text(characterDetailsProvider.appError.errorMessage),
                );
                break;
            }
            return bodyWidget;
          },
        ),
      ),
    );
  }
}
