import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/domain/app_failure.dart';
import '../../../common/infrastructure/error_handler.dart';
import '../domain/details.dart';
import '../domain/i_details_repository.dart';

class DetailsRepository implements IDetailsRepository {
  @override
  Future<Either<AppFailure, DetailsModel>> getDetails(
      int selectedCharacter) async {
    try {
      final url =
          Uri.https('rickandmortyapi.com', '/api/character/$selectedCharacter');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final parsedData = json.decode(response.body);

        return Right(DetailsModel.fromMap(parsedData));
      } else {
        return Left(ErrorHandler.mapError(response));
      }
    } on Exception catch (error) {
      return left(ErrorHandler.mapError(error));
    }
  }
}
