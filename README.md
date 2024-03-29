# Rick & Morty Catalog
Application for consuming an external API and displaying characters from the Rick & Morty series.

## Getting Started
1. Install Flutter and Dart.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Launch the app with `flutter run`.

## Demo

![WhatsApp-Video-2024-02-05-at-16 06 47_edited](https://github.com/FabioCFonseca/rick_morty_api/assets/108895922/a486b836-ea48-4ebb-aab4-961ee8b534ff)

## Project Structure

The project uses Domain Driven Design principles to achieve modularized code with loose coupling, allowing the change of the adapter layer to other state management solutions.

```
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
```

## Libraries

- http: ^1.1.0
- provider: ^6.1.1
- dartz: ^0.10.1
- cached_network_image: ^3.3.1
- shared_preferences: ^2.2.2
  
