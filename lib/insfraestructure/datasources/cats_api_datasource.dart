
import 'package:catbreeds/config/constants/environment.dart';
import 'package:catbreeds/domain/datasources/cats_datasource.dart';
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/insfraestructure/mappers/cat_mapper.dart';
import 'package:catbreeds/insfraestructure/models/cats_api_response.dart';
import 'package:dio/dio.dart';

class CatsApiDatasource extends CatsDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1',
      queryParameters: {
        'x-api-key': Environment.theCatApiKey
      }
    )
  );



  @override
  Future<List<CatEntity>> catBreeds({int limit = 10, int page = 0}) async {
    
    final response = await dio.get('/breeds',
    queryParameters: {
      'limit': limit,
      'page': page
    }
    );

    final List listCats = response.data;

    final List<CatsApiResponse> catsResponse = [
      for (var mapCat in listCats) CatsApiResponse.fromJson(mapCat)
    ];

    final List<CatEntity> cats = catsResponse.map(
      (catResponse) => 
        CatMapper.catApiToEntity(catResponse)
    ).toList();

    return cats;
  }

}