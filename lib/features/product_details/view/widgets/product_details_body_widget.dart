import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/entity/product.dart';
import 'package:tea_delivery/app/ui/widgets/widgets.dart';
import 'package:tea_delivery/features/product_details/domain/product_details_view_model.dart';
import 'package:tea_delivery/router/router.dart';

class ProductBodyDetailsWidget extends StatelessWidget {
  const ProductBodyDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProductDetailsViewModel>();

    final product = model.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderDescriptionWidget(
          price: product.price,
          name: product.name,
          weight: product.weight,
        ),
        const SizedBox(height: 16),
        _BodyDescriptionWidget(product.description),
        const SizedBox(height: 16),
        model.checkProductInCart() == false
            ? const _AddToCartButton()
            : Column(
                children: [
                  _QuantityWidget(product: product),

                  _GoToCartWidget(),
                ],
              ),
      ],
    );
  }
}

class _GoToCartWidget extends StatelessWidget {
  const _GoToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => AutoRouter.of(context).popAndPush(const CartRoute()),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Перейти в козину'),
            SizedBox(width: 8),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProductDetailsViewModel>();
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: model.addProductInCart,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Добавить в корзину'),
            SizedBox(width: 8),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
    );
  }
}

class _QuantityWidget extends StatelessWidget {
  final ProductEntity product;
  const _QuantityWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProductDetailsViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Колличество',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        ChangeQuantity(
          pressOnIncreaseProductButton: () => model.pressOnIncreaseProductButton(),
          pressOnDecreaseProductButton: () => model.pressOnDecreaseProductButton(),
          productQuantity: model.getQuantityProduct(),
        ),
      ],
    );
  }
}

class _BodyDescriptionWidget extends StatelessWidget {
  final String descrption;
  const _BodyDescriptionWidget(this.descrption);

  @override
  Widget build(BuildContext context) {
    return Text(
      descrption,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _HeaderDescriptionWidget extends StatelessWidget {
  final int price;
  final String name;
  final int? weight;
  const _HeaderDescriptionWidget({required this.price, required this.name, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Цена и название
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$price ₽',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            weight != null
                ?
                  // Вес
                  Text(
                    '$weight г',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
