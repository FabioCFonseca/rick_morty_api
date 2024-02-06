import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../domain/catalog.dart';
import '../domain/i_catalog_repository.dart';

class CatalogRepository implements ICatalogRepository {
  @override
  Future<Either<Exception, List<CatalogModel>>> getCatalog() async {
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
          return Left(throw Exception);
        }
      }

      return Right(characters);
    } catch (e) {
      return left(throw Exception);
    }
  }
}