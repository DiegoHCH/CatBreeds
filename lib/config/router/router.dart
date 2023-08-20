
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/views/views.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LandingView.name,
      builder: (context, state) => const LandingView(),
    ),
    GoRoute(
          path: '/detail',
          name: DetailView.name,
          builder: (context, state) {
            CatEntity cat = state.extra as CatEntity;
            return DetailView(cat: cat);
          }
        )
  ]
);