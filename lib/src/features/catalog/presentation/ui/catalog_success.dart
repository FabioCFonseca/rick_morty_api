import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_morty_bloc/src/common/consts/spacers.dart';
import 'package:rick_morty_bloc/src/common/presentation/custom_card.dart';
import 'package:rick_morty_bloc/src/features/catalog/bloc/catalog/catalog_bloc.dart';

class CatalogSuccess extends StatelessWidget {
  const CatalogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        final catalogState = state as CatalogSuccessState;
        return Column(
          children: [
            AppSizes.small(),
            Text(
              'List of Characters',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 350,
                  crossAxisCount: screenWidth > 720 ? 2 : 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: catalogState.catalog.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    character: catalogState.catalog[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
