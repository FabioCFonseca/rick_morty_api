import 'package:dartz/dartz.dart';

import '../../../common/domain/app_error.dart';
import 'character_details_model.dart';

// Interface para abstrair a implementação do repositório/API da camada de domínio
abstract class ICharacterDetailsRepository {
  Future<Either<AppError, CharacterDetailModel>> getDetails(int selectedCharacter);
}
