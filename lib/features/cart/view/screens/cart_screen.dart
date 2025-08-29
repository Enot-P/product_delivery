import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/features/cart/domain/cart_view_model.dart';
import 'package:tea_delivery/features/product_list/view/widgets/tea_card_widget.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ChangeNotifierProvider(
          create: (_) => CartViewModel(),
          child: const Scaffold(
            body: _CartProducts(),
          ),
        ),
      ),
    );
  }
}

class _CartProducts extends StatelessWidget {
  const _CartProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CartViewModel>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30),
      itemCount: model.listTea.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TeaCardWidget(
            tea: model.listTea[index],
          ),
        );
      },
    );
  }
}
