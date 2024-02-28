import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/features/favorites/bloc/favorites_bloc.dart';

import '../../../common/presentation/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        FavoritesState favoriteState = state;
        return favoriteState.favorites.isEmpty
            ? Center(
                child: Text(
                  'No favorite characters added',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'List of Favorites Characters',
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
