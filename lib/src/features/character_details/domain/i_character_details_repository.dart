import 'package:dartz/dartz.dart';

import 'package:rick_morty_flutter/src/features/character_details/domain/character_details_model.dart';

abstract class ICharacterDetailsRepository {
  Future<Either<Exception, CharacterDetailModel>> getDetails(int selectedCharacter);
}
