import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/entity/entity.dart';
import 'package:tea_delivery/app/ui/widgets/widgets.dart';
import 'package:tea_delivery/features/cart/domain/cart_view_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CartViewModel>();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Row(
        children: [
          _ProductImageWidget(image: cartItem.product.image),
          const SizedBox(width: 10),
          Expanded(
            child: _ProductDescriptionWidget(
              name: cartItem.product.name,
              description: cartItem.product.description,
              price: cartItem.product.price,
              quantity: cartItem.quantity,
              weight: cartItem.product.weight,
            ),
          ),
          ChangeQuantity(
            pressOnIncreaseProductButton: () => model.pressOnIncreaseProductButton(cartItem.product),
            pressOnDecreaseProductButton: () => model.pressOnDecreaseProductButton(cartItem.product),
            productQuantity: model.getQuantityProduct(cartItem.product),
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
    required this.quantity,
    this.weight,
  });

  final String name;
  final String description;
  final int price;
  final int? weight;
  final int quantity;

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
              '${price * quantity} ₽',
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
