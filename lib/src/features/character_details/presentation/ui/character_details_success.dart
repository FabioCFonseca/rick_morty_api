import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_flutter/src/features/character_details/provider/character_details_provider.dart';

class CharacterDetailsSuccess extends StatelessWidget {
  const CharacterDetailsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterDetailsProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Characters Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    if (provider.character.image.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(provider.character.image),
                      ),
                    const SizedBox(height: 16.0),
                    Text(
                      provider.character.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'ID: ${provider.character.id}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text('Specie: ${provider.character.species}'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.transgender,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text('Gender: ${provider.character.gender}'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text('Origin: ${provider.character.origin}'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.compare_arrows,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text('Status: ${provider.character.status}'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.contact_emergency_outlined,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text('Type: ${provider.character.type}'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        );
      },
    );
  }
}
