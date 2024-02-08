import 'package:flutter/material.dart';

import '../domain/catalog.dart';
import 'ui/custom_card.dart';

class CatalogPage extends StatelessWidget {
  final List<CatalogModel> catalog;

  const CatalogPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
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
              itemCount: catalog.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  character: catalog[index],
                );
              }),
        )
      ],
    );
  }
}
