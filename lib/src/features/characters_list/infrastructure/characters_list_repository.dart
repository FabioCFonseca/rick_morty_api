import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../characters_list/domain/character_model.dart';
import '../../../common/domain/app_error.dart';

class CharactersListRepository {
  Future<Either<AppError, List<CharacterModel>>> getCharacters() async {
    try {
      final characters = <CharacterModel>[];
      for (int currentPage = 1; currentPage <= 42; currentPage++) {
        final url = Uri.https('rickandmortyapi.com', '/api/character',
            {'page': currentPage.toString()});
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final parsedData = json.decode(response.body);
          final characterData = parsedData['results'] as List;
          characters.addAll(characterData.map((element) => CharacterModel(
              name: element['name'],
              image: element['image'],
              id: element['id'])));
        } else {
          return Left(AppError(statusCode: response.statusCode));
        }
      }

      return Right(characters);
    } catch (error) {
      throw Exception(error);
    }
  }
}
