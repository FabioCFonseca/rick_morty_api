import 'package:dartz/dartz.dart';

import '../../../common/domain/app_failure.dart';
import 'details.dart';

abstract class IDetailsRepository {
  Future<Either<AppFailure, DetailsModel>> getDetails(int selectedCharacter);
}
