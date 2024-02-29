import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_getx/src/features/catalog/application/catalog_controller.dart';
import 'package:rick_morty_getx/src/features/catalog/infrastructure/catalog_repository.dart';
import 'package:rick_morty_getx/src/features/favorites/application/favorites_controller.dart';

import 'src/common/presentation/home_page.dart';
import 'src/utils/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize user preferences
  await UserPreferences.init();

  // DI para catalog feature
  Get.put<CatalogRepository>(CatalogRepository());
  Get.put<CatalogController>(CatalogController(Get.find<CatalogRepository>())).controllerStart();

  // DI para catalog feature
  Get.put<FavoritesController>(FavoritesController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color primaryColor = const Color(0xff00A9D4);
  final Color backgroundColor = const Color(0xff2B2D32);
  final Color cardColor = const Color(0xffF2F2F2);
  final Color borderColor = const Color(0xffA333C8);
  final Color bottomNavColor = const Color(0xff006782);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);

    final themeData = ThemeData(
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Blippo',
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Blippo',
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Blippo',
            fontSize: 16.0,
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Blippo',
            fontSize: 18.0,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          )),
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      cardTheme: CardTheme(
        color: cardColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bottomNavColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      useMaterial3: false,
    );

    //GETMATERIAL APP FOR NAVIGATION
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
