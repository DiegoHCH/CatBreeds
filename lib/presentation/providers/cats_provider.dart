import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/presentation/providers/cat_repository_provider.dart';

final catsBreedsProvider = StateNotifierProvider<CatsNotifier, List<CatEntity>>((ref) {
  final fetchMoreCats = ref.watch(catRepositoryProvider).catBreeds;
  return CatsNotifier(
    fetchMoreCats: fetchMoreCats
  );
});


typedef CatCallback = Future<List<CatEntity>> Function({int limit, int page});

class CatsNotifier extends StateNotifier<List<CatEntity>> {

  int currentPage = 0;
  CatCallback fetchMoreCats;
  bool isLoading = false;

  CatsNotifier({
    required this.fetchMoreCats
  }):super([]);

  Future<void> loadMoreCats() async {

    if( isLoading ) return;

    isLoading = true;

    final List<CatEntity> cats = await fetchMoreCats(limit: 10, page: currentPage);

    state = [...state, ...cats];
    currentPage++;
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

}