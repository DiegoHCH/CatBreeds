

import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/domain/repositories/cat_repository.dart';
import 'package:catbreeds/insfraestructure/datasources/cats_api_datasource.dart';

class CatRepositoryImpl extends CatRepository{

  final CatsApiDatasource datasource;

  CatRepositoryImpl(this.datasource);
  
  @override
  Future<List<CatEntity>> catBreeds({int limit = 10, int page = 0}) {
    return datasource.catBreeds(limit: limit, page: page);
  }
  
}