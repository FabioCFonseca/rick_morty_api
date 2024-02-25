import 'package:dartz/dartz.dart';
import 'package:rick_morty_flutter/src/common/domain/app_error.dart';

import 'package:rick_morty_flutter/src/features/character_details/domain/character_details_model.dart';

abstract class ICharacterDetailsRepository {
  Future<Either<AppError, CharacterDetailModel>> getDetails(int selectedCharacter);
}
