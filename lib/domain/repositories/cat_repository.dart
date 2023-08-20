
import '../entities/cat_entity.dart';

abstract class CatRepository {

  Future<List<CatEntity>> catBreeds({int limit = 10, int page = 0});

}