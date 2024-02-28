import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/features/favorites/bloc/favorites_bloc.dart';

import '../../catalog/presentation/ui/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        FavoritesState favoriteState = state;
        return Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'List of Characters',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: favoriteState.favorites.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      character: favoriteState.favorites[index],
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
