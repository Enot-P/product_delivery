import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/features/product_list/domain/domain.dart';
import 'package:tea_delivery/features/product_list/view/widgets/product_card_widget.dart';
import 'package:tea_delivery/router/router.dart';

@RoutePage()
class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GetIt.I<ProductsListViewModel>(),
      child: const Scaffold(
        body: Center(
          child: _CatalogProducts(),
        ),
      ),
    );
  }
}

class _CatalogProducts extends StatelessWidget {
  const _CatalogProducts();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProductsListViewModel>();
    if (model.isLoading) {
      return const CircularProgressIndicator();
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 30),
          itemCount: model.productList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.58,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => context.router.push(ProductDetailsRoute(id: index)),
              child: ProductCardWidget(
                product: model.productList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
