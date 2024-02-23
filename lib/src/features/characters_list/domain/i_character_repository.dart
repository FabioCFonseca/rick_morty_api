import 'package:dartz/dartz.dart';

import 'character_model.dart';

// Interface para abstrair a implementação do repositório/API da camada de domínio
abstract class ICharacterRepository {
  Future<Either<Exception, List<CharacterModel>>> getCharacters();
}
