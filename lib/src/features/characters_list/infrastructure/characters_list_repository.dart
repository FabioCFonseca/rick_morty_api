import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../characters_list/domain/character_model.dart';
import '../../../common/domain/app_error.dart';
import '../domain/i_character_repository.dart';

// Chamada API implementa a interface do repositório no domínio
// se comunicando com a mesma somente através de interface e 
// se desacoplando das camadas restantes
class CharactersListRepository implements ICharacterRepository {

  // Chamada API com utilização de paradigma funcional com o
  // pacote Dartz para o error handling
  // A assinatura de uma função Either explicita que a mesma pode retornar um erro
  // enforçando o tratamento deste erro
  // Sem deixar explicito a possibilidade de um erro temos que 'lembrar' de tratar o 
  // erro no código
  // Não é possível ignorar o tratamento do erro ou o código não irá compilar
  
  @override
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
