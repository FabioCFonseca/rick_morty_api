import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/domain/app_failure.dart';
import '../../../common/infrastructure/error_handler.dart';
import '../domain/catalog.dart';

class CatalogRepository {
  Future<Either<AppFailure, List<CatalogModel>>> getCatalog() async {
    try {
      final characters = <CatalogModel>[];
      for (int currentPage = 1; currentPage <= 42; currentPage++) {
        final url = Uri.https('rickandmortyapi.com', '/api/character',
            {'page': currentPage.toString()});
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final parsedData = json.decode(response.body);
          final catalogData = parsedData['results'] as List;
          characters.addAll(
            catalogData.map((element) => CatalogModel.fromMap(element)),
          );
        } else {
          return Left(ErrorHandler.mapError(response));
        }
      }

      return Right(characters);
    } on Exception catch (error) {
      return left(ErrorHandler.mapError(error));
    }
  }
}
