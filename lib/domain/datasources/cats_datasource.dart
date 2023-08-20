
import '../entities/cat_entity.dart';

abstract class CatsDatasource {

  Future<List<CatEntity>>catBreeds({int limit = 10, int page = 0});

}