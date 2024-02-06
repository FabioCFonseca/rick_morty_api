import 'package:dartz/dartz.dart';

import 'details.dart';

abstract class IDetailsRepository {
  Future<Either<Exception, DetailsModel>> getDetails(int selectedCharacter);
}
