// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../provider/character_list_provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.isFavorite,
      required this.selectedList,
      required this.index});

  final bool isFavorite;
  final List selectedList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterListProvider>(context);

    return Card(
      margin: const EdgeInsets.all(35),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: CachedNetworkImage(
                  imageUrl: selectedList[index].image,
                  width: 150,
                  height: 150,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                )),
            const SizedBox(height: 10),
            Text(selectedList[index].name,
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      provider.goToDetails(context, selectedList[index].id);
                    },
                    child: Text('Details',
                        style: Theme.of(context).textTheme.bodyMedium)),
                GestureDetector(
                  onTap: () {
                    provider.toggleFavorite(selectedList[index]);
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: Color(0xffA333C8),
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
