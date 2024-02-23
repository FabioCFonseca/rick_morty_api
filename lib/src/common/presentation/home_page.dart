import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/characters_list/provider/character_list_provider.dart';
import '../../features/characters_list/presentation/characters_list_page.dart';
import '../../features/characters_list/presentation/favorites_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CachedNetworkImage(
            imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 70,
          ),
        ),
      ),
      body: Consumer<CharacterListProvider>(
        builder: (context, provider, child) {
          return PageView(
            controller: provider.pageController,
            children: const [
              CharactersListPage(),
              FavoritesPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<CharacterListProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            elevation: 50,
            iconSize: 26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: provider.currentPage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
            ],
            onTap: provider.setPage,
          );
        },
      ),
    );
  }
}
