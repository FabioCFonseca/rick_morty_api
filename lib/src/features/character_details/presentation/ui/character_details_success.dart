import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/character_details_provider.dart';

class CharacterDetailsSuccess extends StatelessWidget {
  const CharacterDetailsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final characterDetailsProvider =
        Provider.of<CharacterDetailsProvider>(context);

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Characters Details',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (characterDetailsProvider.character.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child:
                      Image.network(characterDetailsProvider.character.image),
                ),
              const SizedBox(height: 16.0),
              Text(
                characterDetailsProvider.character.name,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                'ID: ${characterDetailsProvider.character.id}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 25.0),
              Row(
                children: [
                  const Icon(Icons.person,
                      color: Color(0xFF70A2D6), size: 25.0),
                  const SizedBox(width: 8.0),
                  Text('Specie: ${characterDetailsProvider.character.species}'),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.transgender,
                      color: Color(0xFF70A2D6), size: 25.0),
                  const SizedBox(width: 8.0),
                  Text('Gender: ${characterDetailsProvider.character.gender}'),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.location_on,
                      color: Color(0xFF70A2D6), size: 25.0),
                  const SizedBox(width: 8.0),
                  Text('Origin: ${characterDetailsProvider.character.origin}'),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.compare_arrows,
                      color: Color(0xFF70A2D6), size: 25.0),
                  const SizedBox(width: 8.0),
                  Text('Status: ${characterDetailsProvider.character.status}'),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.contact_emergency_outlined,
                      color: Color(0xFF70A2D6), size: 25.0),
                  const SizedBox(width: 8.0),
                  Text('Type: ${characterDetailsProvider.character.type}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
