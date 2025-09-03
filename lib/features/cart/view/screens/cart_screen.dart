import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/features/cart/domain/cart_view_model.dart';

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
  const _CartProducts({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CartViewModel>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30),
      itemCount: model.cartItems.length,
      itemBuilder: (context, index) {
        return CartItemWidget(CartItem: model.cartItems[index]);
      },
    );
  }
}

class CartItemWidget extends StatefulWidget {
  final CartItemEntity CartItem;
  CartItemWidget({super.key, required this.CartItem});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Row(
        children: [
          _ProductImageWidget(image: widget.CartItem.product.image),
          const SizedBox(width: 10),
          Expanded(
            child: _ProductDescriptionWidget(
              name: widget.CartItem.product.name,
              description: widget.CartItem.product.description,
              price: widget.CartItem.product.price,
              weight: widget.CartItem.product.weight,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductDescriptionWidget extends StatelessWidget {
  const _ProductDescriptionWidget({
    required this.name,
    required this.description,
    required this.price,
    this.weight,
  });

  final String name;
  final String description;
  final int price;
  final int? weight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
            fontSize: 12,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '$price ₽',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (weight != null)
              Text(
                ' $weight г',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _ProductImageWidget extends StatelessWidget {
  const _ProductImageWidget({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Image.asset(
        image,
        width: 95,
        // height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ChangeQuantity extends StatefulWidget {
  _ChangeQuantity({super.key});

  @override
  State<_ChangeQuantity> createState() => __ChangeQuantityState();
}

class __ChangeQuantityState extends State<_ChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
          ),
          padding: EdgeInsets.zero,
        ),
        Text(
          '1',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove,
          ),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
