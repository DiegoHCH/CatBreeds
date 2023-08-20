import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {

  static const name = 'detail-view';

  final CatEntity cat;

  const DetailView({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
                child: Image.network('https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg',
                height: 200,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                  return FadeIn(child: child);
                }
                ),
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Descripcion:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(cat.description),
                    const Text('Tiempo de Vida:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(cat.lifeSpan),
                    const Text('Origen:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(cat.origin),
                    const Text('Temperamento:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(cat.temperament),
                    _Characteristics(characteristic: 'Adaptabilidad', value: cat.adaptability.toString()),
                    _Characteristics(characteristic: 'Nivel de Afecto', value: cat.affectionLevel.toString()),
                    _Characteristics(characteristic: 'Amigable con niños', value: cat.childFriendly.toString()),
                    _Characteristics(characteristic: 'Amigable con Perros', value: cat.dogFriendly.toString()),
                    _Characteristics(characteristic: 'Nivel de Energia', value: cat.energyLevel.toString()),
                    _Characteristics(characteristic: 'Aseo', value: cat.grooming.toString()),
                    _Characteristics(characteristic: 'Problemas de Salud', value: cat.healthIssues.toString()),
                    _Characteristics(characteristic: 'Nivel de Derramamiento', value: cat.sheddingLevel.toString()),
                    _Characteristics(characteristic: 'Necesidades sociales', value: cat.socialNeeds.toString()),
                    _Characteristics(characteristic: 'Amigable con Desconocidos', value: cat.strangerFriendly.toString()),
                    _Characteristics(characteristic: 'Vocalizacion', value: cat.vocalisation.toString()),
                  
                  ],
                ),
              ),
            )
          ],
        ),
        )
    );
  }
}

class _Characteristics extends StatelessWidget {

  final String characteristic;
  final String value;

  const _Characteristics({ required this.characteristic, required this.value,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text('$characteristic:', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}