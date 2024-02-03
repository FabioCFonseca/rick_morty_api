import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/error_indicator.dart';
import '../../../common/presentation/loading.dart';
import '../provider/character_list_provider.dart';
import 'ui/characters_success.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterListProvider>(context);
    return Scaffold(
      body: provider.providerStatus == CharacterListProviderState.loading
          ? const LoadingInidicator()
          : provider.providerStatus == CharacterListProviderState.success
              ? const CharactersSuccess()
              : ErrorIndicator(
                  error: provider.appError,
                ),
    );
  }
}
