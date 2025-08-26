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
          child: _catalogProducts(),
        ),
      ),
    );
  }
}

class _catalogProducts extends StatelessWidget {
  const _catalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProductsListViewModel>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.63, // Соотношение ширины к высоте карточки
          ),
          itemCount: model.listTea.length, // Замените на реальное количество товаров
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => context.router.push(const ProductDetailsRoute()),
              child: TeaCardWidget(
                tea: model.listTea[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
