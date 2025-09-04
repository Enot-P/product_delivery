import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/app/ui/widgets/green_button_widget.dart';
import 'package:tea_delivery/features/cart/domain/cart_view_model.dart';
import 'package:tea_delivery/features/cart/view/widgets/card_cart_item_widget.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ChangeNotifierProvider.value(
          value: GetIt.I<CartViewModel>(),
          child: const Scaffold(
            body: _CartProductsWidget(),
          ),
        ),
      ),
    );
  }
}

class _CartProductsWidget extends StatelessWidget {
  const _CartProductsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cartItems = context.select<CartViewModel, List<CartItemEntity>>((cart) => cart.cartItems);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 30),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CartItemWidget(cartItem: cartItems[index]),
              );
            },
          ),
        ),

        const Row(
          children: [
            Expanded(
              child: _FinalPriceWidget(),
            ),
            Expanded(flex: 2, child: _BuyButtonWidget()),
          ],
        ),
      ],
    );
  }
}

class _FinalPriceWidget extends StatelessWidget {
  const _FinalPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final finalPrice = context.select<CartViewModel, int>((cart) => cart.finalPrice);
    return Column(
      children: [
        const Text('Итого к оплате:'),
        Text('$finalPrice'),
      ],
    );
  }
}

class _BuyButtonWidget extends StatelessWidget {
  const _BuyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GreenButtonWidget(onPressButton: () {}, icon: const Icon(Icons.shopping_cart), text: "Оплатить");
  }
}
