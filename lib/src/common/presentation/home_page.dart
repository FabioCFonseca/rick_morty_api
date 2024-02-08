import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/src/features/catalog/bloc/bottomNavBar/bnb_bloc.dart';
import 'package:rick_morty_bloc/src/features/catalog/bloc/favorites/favorites_bloc.dart';

import '../../features/catalog/bloc/catalog/catalog_bloc.dart';
import '../../features/catalog/presentation/catalog_page.dart';
import '../../features/catalog/presentation/favorites_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final PageController pageController = PageController(initialPage: 0);

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
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 70,
          ),
        ),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case CatalogLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CatalogSuccessState:
              final catalogState = state as CatalogSuccessState;
              return BlocBuilder<BnbBloc, BnbState>(
                builder: (context, bnbState) {
                  return PageView(
                    controller: pageController,
                    children: [
                      CatalogPage(catalog: catalogState.catalog),
                      BlocBuilder<FavoritesBloc, FavoritesState>(
                          builder: ((context, state) =>
                              FavoritesPage(favorites: state.favorites))),
                    ],
                  );
                },
              );
            default:
              return Text('error');
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BnbBloc, BnbState>(
        builder: (context, state) {
          return BottomNavigationBar(
            elevation: 50,
            iconSize: 26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: state.currentPage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            ],
            onTap: (index) {
              BlocProvider.of<BnbBloc>(context)
                  .add(PageChange(currentPage: index));

              // Associates the bottomNav with the Pageview
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
            },
          );
        },
      ),
    );
  }
}
