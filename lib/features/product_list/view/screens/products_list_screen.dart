import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/features/product_list/domain/domain.dart';
import 'package:tea_delivery/features/product_list/view/widgets/tea_card_widget.dart';
import 'package:tea_delivery/router/router.dart';

@RoutePage()
class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsListViewModel(),
      child: const Scaffold(
        body: Center(
          child: _CatalogProducts(),
        ),
      ),
    );
  }
}

class _CatalogProducts extends StatelessWidget {
  const _CatalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProductsListViewModel>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 30),
          itemCount: model.listTea.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                onTap: () => context.router.push(const ProductDetailsRoute()),
                child: TeaCardWidget(
                  tea: model.listTea[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
