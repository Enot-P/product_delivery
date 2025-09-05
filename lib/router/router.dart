import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tea_delivery/features/features.dart';
import 'package:tea_delivery/router/auth_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AuthRoute.page,
      path: '/',
      guards: [AuthGuard()],
    ),

    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      children: [
        AutoRoute(
          page: ProductsListRoute.page,
          path: 'product_list',
        ),
        AutoRoute(
          page: CartRoute.page,
          path: 'cart',
        ),
      ],
    ),

    AutoRoute(
      page: ProductDetailsRoute.page,
      path: '/product_details/:id',
    ),
  ];
}
