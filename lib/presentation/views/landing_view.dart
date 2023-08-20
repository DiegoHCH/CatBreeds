import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:catbreeds/presentation/providers/cats_provider.dart';
import 'package:catbreeds/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class LandingView extends StatelessWidget {

  static const name = 'landing-view';

  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LandingScreen(),
    );
  }
}

class _LandingScreen extends ConsumerStatefulWidget {
  const _LandingScreen();

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<_LandingScreen> {

  final TextEditingController searchController = TextEditingController();

  final scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    ref.read(catsBreedsProvider.notifier).loadMoreCats();
    scrollController.addListener(() {

      if( scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent ) {
        ref.read(catsBreedsProvider.notifier).loadMoreCats();
      }
    });
    
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final cats = ref.watch(catsBreedsProvider);

    return Column(
      children: [
        const CustomAppBar(),
        SearchBar(
          controller: searchController,
          hintText: 'Buscar...',
          trailing: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.search),
            ),
          ],
          backgroundColor:  MaterialStateProperty.all(Colors.white70),
          elevation: const  MaterialStatePropertyAll(0),
        ),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: cats.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final cat = cats[index];
              return _CardCat(cat: cat);
            },
          ),
        )
      ],
    );
  }
}

class _CardCat extends StatelessWidget {

  

  const _CardCat({
    required this.cat,
  });

  final CatEntity cat;

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.bodyMedium;

    return InkWell(
      onTap: () => context.push('/detail', extra: cat),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Raza : ${cat.name}', style: titleStyle,),
                  const Spacer(),
                  Text('Mas...', style: titleStyle,)
                ],
              ),
              const SizedBox(height: 16,),
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
              Row(
                children: [
                  Text('Pais de Origen: ${cat.origin}', style: titleStyle, textAlign: TextAlign.start,),
                ],
              )
            ],
          ),
          ),
      ),
    );
  }
}