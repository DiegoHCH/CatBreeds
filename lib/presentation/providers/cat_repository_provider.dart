
import 'package:catbreeds/insfraestructure/datasources/cats_api_datasource.dart';
import 'package:catbreeds/insfraestructure/repositories/cat_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catRepositoryProvider = Provider((ref) {
  return CatRepositoryImpl(CatsApiDatasource());
});