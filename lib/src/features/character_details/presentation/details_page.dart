// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_flutter/src/features/character_details/presentation/ui/character_details_success.dart';
import '../../../common/presentation/error_indicator.dart';
import '../infrastructure/character_details_repository.dart';
import '../provider/character_details_provider.dart';
import '../../../common/presentation/loading.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.selectedCharacter});

  final int selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CharacterDetailsProvider>(
      create: (context) => CharacterDetailsProvider(
        selectedCharacter: selectedCharacter,
        repository: CharactersDetailsRepository(),
      )..controllerStart(),
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<CharacterDetailsProvider>(
          builder: (context, characterDetailsProvider, child) {
            if (characterDetailsProvider.providerStatus ==
                CharacterDetailsProviderState.loading) {
              return LoadingInidicator();
            } else if (characterDetailsProvider.providerStatus ==
                CharacterDetailsProviderState.success) {
              return CharacterDetailsSuccess();
            } else {
              return ErrorIndicator(error: characterDetailsProvider.appError);
            }
          },
        ),
      ),
    );
  }
}
