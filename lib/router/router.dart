import 'package:auto_route/auto_route.dart';
import 'package:tea_delivery/features/features.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      children: [
        AutoRoute(
          page: ProfileRoute.page,
          path: 'profile',
        ),
        AutoRoute(
          page: ProductsListRoute.page,
          path: 'product_list',
        ),
        AutoRoute(
          page: HistoryRoute.page,
          path: 'history',
        ),
      ],
    ),

    AutoRoute(
      page: ProductDetailsRoute.page,
      path: '/product_details',
    ),
  ];
}
