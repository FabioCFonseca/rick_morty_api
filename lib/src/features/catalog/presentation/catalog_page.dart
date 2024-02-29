import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_morty_bloc/src/common/presentation/loading.dart';
import 'package:rick_morty_bloc/src/features/catalog/bloc/catalog/catalog_bloc.dart';
import 'package:rick_morty_bloc/src/features/catalog/presentation/ui/catalog_success.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case CatalogLoadingState:
            return const LoadingIndicator();
          case CatalogSuccessState:
            return const CatalogSuccess();
          default:
            return const Text('error');
        }
      },
    );
  }
}
