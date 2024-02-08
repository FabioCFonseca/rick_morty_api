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
|   |   |-- features/
|   |   |   |-- catalog/
|   |   |   |   |-- bloc/
|   |   |   |   |   |-- bottomNav/
|   |   |   |   |   |   |-- bnb_bloc.dart
|   |   |   |   |   |   |-- bnb_event.dart
|   |   |   |   |   |   |-- bnb_state.dart
|   |   |   |   |   |-- catalog/
|   |   |   |   |   |   |-- catalog_bloc.dart
|   |   |   |   |   |   |-- catalog_event.dart
|   |   |   |   |   |   |-- catalog_state.dart
|   |   |   |   |   |-- favorites/
|   |   |   |   |   |   |-- favorites_bloc.dart
|   |   |   |   |   |   |-- favorites_event.dart
|   |   |   |   |   |   |-- favorites_state.dart
|   |   |   |   |-- domain/
|   |   |   |   |   |-- catalog.dart
|   |   |   |   |-- infrastructure/
|   |   |   |   |   |-- catalog_repository.dart
|   |   |   |   |-- presentation/
|   |   |   |   |   |-- ui/
|   |   |   |   |   |   |-- custom_card.dart
|   |   |   |   |   |-- catalog_page.dart
|   |   |   |   |   |-- catalog_success.dart
|   |   |   |-- details/
|   |   |   |   |-- bloc/
|   |   |   |   |   |-- details_bloc.dart
|   |   |   |   |   |-- state_bloc.dart
|   |   |   |   |   |-- event_bloc.dart
|   |   |   |   |-- domain/
|   |   |   |   |   |-- details_model.dart
|   |   |   |   |-- infrastructure/
|   |   |   |   |   |-- details_repository.dart
|   |   |   |   |-- presentation/
|   |   |   |   |   |-- details_page.dart
|   |   |   |   |   |-- details_success.dart
|-- main.dart
```

## Libraries

- dartz: ^0.10.1
- flutter_bloc: ^8.1.3
- http: ^0.13.5
- shared_preferences: ^2.2.2
- cached_network_image: ^3.3.1
