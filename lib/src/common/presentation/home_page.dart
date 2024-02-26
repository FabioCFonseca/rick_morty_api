import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';

import '../../features/catalog/application/catalog_controller.dart';
import '../../features/catalog/presentation/catalog_page.dart';
import '../../features/catalog/presentation/favorites_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CatalogController controller = Get.find<CatalogController>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CachedNetworkImage(
            imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
            errorWidget: (context, url, error) => const Icon(FontAwesome.exclamation_circle),
            height: 70,
          ),
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        children: const [
          CatalogPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 50,
            iconSize: 26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.currentPage.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome.home), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome.heart), label: ''),
            ],
            onTap: controller.setPage,
          )),
    );
  }
}
