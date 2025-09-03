import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tea_delivery/app/repositories/cart_repository.dart';
import 'package:tea_delivery/features/cart/domain/domain.dart';
import 'package:tea_delivery/router/router.dart';

void main() {
  GetIt.I.registerLazySingleton(() => CartRepository());
  GetIt.I.registerLazySingleton(() => CartViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'tea_shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router.config(),
    );
  }
}
