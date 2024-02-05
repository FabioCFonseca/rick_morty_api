# Rick & Morty Catalog
Aplicação para consumo de API externa e exibição dos personagens da série Rick & Morty

## Getting Started
1. Install Flutter and Dart.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Launch the app with `flutter run`.

## Demo

![WhatsApp-Video-2024-02-05-at-16 06 47](https://github.com/FabioCFonseca/rick_morty_api/assets/108895922/7603d743-3475-49f8-8bb8-9c51d05f000a)

## Project Structure

The project uses Domain Driven Design principles to achieve a modularizted code with loose coupling to allow the change of the adapter layer to others state managements solutions

rick_morty_api/
|-- lib/
|   |-- src/
|   |   |-- common/
|   |   |   |-- presentation/
|   |   |   |   |-- home_page.dart
|   |   |   |   |-- error_indicator.dart
|   |   |   |   |-- loading.dart
|   |   |   |-- domain/
|   |   |   |   |-- app_error.dart
|   |   |-- features/
|   |   |   |-- catalog/
|   |   |   |   |-- application/
|   |   |   |   |   |-- catalog_controller.dart
|   |   |   |   |-- domain/
|   |   |   |   |   |-- catalog_model.dart
|   |   |   |   |-- infrastructure/
|   |   |   |   |   |-- catalog_repository.dart
|   |   |   |   |-- presentation/
|   |   |   |   |   |-- catalog_page.dart
|   |   |   |   |   |-- catalog_success.dart
|   |   |   |-- details/
|   |   |   |   |-- application/
|   |   |   |   |   |-- details_controller.dart
|   |   |   |   |-- domain/
|   |   |   |   |   |-- details_model.dart
|   |   |   |   |-- infrastructure/
|   |   |   |   |   |-- details_repository.dart
|   |   |   |   |-- presentation/
|   |   |   |   |   |-- details_page.dart
|   |   |   |   |   |-- details_success.dart
|   |   |-- utils/
|   |   |   |-- user_preferences.dart
|-- main.dart

## Libraries

- http: ^1.1.0
- provider: ^6.1.1
- dartz: ^0.10.1
- cached_network_image: ^3.3.1
- shared_preferences: ^2.2.2
  
