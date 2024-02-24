import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_flutter/src/common/presentation/loading.dart';
import 'package:rick_morty_flutter/src/features/characters_list/presentation/ui/characters_success.dart';
import 'package:rick_morty_flutter/src/features/characters_list/provider/character_list_provider.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterListProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.providerStatus == CharacterListProviderState.loading
              ? const LoadingInidicator()
              : provider.providerStatus == CharacterListProviderState.success
                  ? const CharactersSuccess()
                  : Center(child: Text(provider.appError.errorMessage)),
        );
      },
    );
  }
}
