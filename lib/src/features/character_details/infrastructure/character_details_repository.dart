import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../common/domain/app_error.dart';
import '../domain/character_details_model.dart';

class CharactersDetailsRepository {
  Future<Either<AppError, CharacterDetailModel>> getCharactersDetails(
      int selectedCharacter) async {
    try {
      final url =
          Uri.https('rickandmortyapi.com', '/api/character/$selectedCharacter');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final parsedData = json.decode(response.body);
        final characterData = parsedData;

        return Right(CharacterDetailModel(
          id: characterData['id'],
          name: characterData['name'],
          gender: characterData['gender'],
          image: characterData['image'],
          origin: characterData['origin']['name'],
          species: characterData['species'],
          status: characterData['status'],
          type: characterData['type'],
        ));
      } else {
        return Left(AppError(statusCode: response.statusCode));
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
