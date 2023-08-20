
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/insfraestructure/models/cats_api_response.dart';

class CatMapper {


  static CatEntity catApiToEntity(CatsApiResponse catResponse) => CatEntity(
      weight: '', 
      id: catResponse.id, 
      name: catResponse.name, 
      cfaUrl: catResponse.cfaUrl!, 
      vetstreetUrl: catResponse.vetstreetUrl!, 
      vcahospitalsUrl: catResponse.vcahospitalsUrl!, 
      temperament: catResponse.temperament, 
      origin: catResponse.origin, 
      countryCodes: catResponse.countryCodes, 
      countryCode: catResponse.countryCode, 
      description: catResponse.description, 
      lifeSpan: catResponse.lifeSpan, 
      indoor: catResponse.indoor, 
      lap: catResponse.lap!, 
      altNames:catResponse.altNames, 
      adaptability: catResponse.adaptability, 
      affectionLevel: catResponse.affectionLevel, 
      childFriendly: catResponse.childFriendly, 
      dogFriendly: catResponse.dogFriendly, 
      energyLevel: catResponse.energyLevel, 
      grooming: catResponse.grooming, 
      healthIssues: catResponse.healthIssues, 
      intelligence: catResponse.intelligence, 
      sheddingLevel: catResponse.sheddingLevel, 
      socialNeeds: catResponse.socialNeeds, 
      strangerFriendly: catResponse.strangerFriendly, 
      vocalisation: catResponse.vocalisation, 
      experimental: catResponse.experimental, 
      hairless: catResponse.hairless, 
      natural: catResponse.natural, 
      rare: catResponse.rare, 
      rex: catResponse.rex, 
      suppressedTail: catResponse.suppressedTail, 
      shortLegs: catResponse.shortLegs, 
      wikipediaUrl: catResponse.wikipediaUrl, 
      hypoallergenic: catResponse.hypoallergenic, 
      referenceImageId: catResponse.referenceImageId,
    );
}