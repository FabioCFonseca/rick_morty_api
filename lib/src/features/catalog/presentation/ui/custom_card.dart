import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../details/presentation/details_page.dart';
import '../../bloc/favorites/favorites_bloc.dart';
import '../../domain/catalog.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.character}) : super(key: key);

  final CatalogModel character;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(35),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  character.image,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(character.name, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                selectedCharacter: character.id,
                              )),
                    );
                  },
                  child: const Text('Details'),
                ),
                BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                    return GestureDetector(
                        child: Icon(
                          state.favorites.contains(character)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Color(0xffA333C8),
                          size: 30,
                        ),
                        onTap: () => BlocProvider.of<FavoritesBloc>(context)
                            .add(FavoritesAddCharacterEvent(
                                character: character)));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
