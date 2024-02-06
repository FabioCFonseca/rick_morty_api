import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_morty_mobx_/src/features/details/presentation/favorites_page.dart';

import '../../../injection_container.dart';
import '../../features/catalog/application/catalog_controller.dart';
import '../../features/catalog/presentation/catalog_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = sl.get<CatalogController>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CachedNetworkImage(
            imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 70,
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return PageView(
          controller: controller.pageController,
          children: const [
            CatalogPage(),
            FavoritesPage(),
          ],
        );
      }),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomNavigationBar(
          elevation: 50,
          iconSize: 26,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          ],
          onTap: controller.setPage,
        );
      }),
    );
  }
}
