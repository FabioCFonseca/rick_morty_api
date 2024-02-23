import 'package:dartz/dartz.dart';

import 'character_details_model.dart';

abstract class ICharacterDetailsRepository {
  Future<Either<Exception, CharacterDetailModel>> getDetails(int selectedCharacter);
}
