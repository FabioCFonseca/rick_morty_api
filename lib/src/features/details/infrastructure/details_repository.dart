import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../domain/details.dart';
import '../domain/i_details_repository.dart';

class DetailsRepository implements IDetailsRepository {
  @override
  Future<Either<Exception, DetailsModel>> getDetails(
      int selectedCharacter) async {
    try {
      final url =
          Uri.https('rickandmortyapi.com', '/api/character/$selectedCharacter');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final parsedData = json.decode(response.body);

        return Right(DetailsModel.fromMap(parsedData));
      } else {
        return Left(throw Exception);
      }
    } catch (e) {
      return left(throw Exception);
    }
  }
}
