import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/entity/product.dart';
import 'package:tea_delivery/app/ui/widgets/widgets.dart';
import 'package:tea_delivery/features/product_list/domain/domain.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProductsListViewModel>();
    final productInCart = model.checkProductInCart(product);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Row(
        children: [
          _ProductImageWidget(image: product.image),
          const SizedBox(width: 10),
          Expanded(
            child: _ProductDescriptionWidget(
              name: product.name,
              description: product.description,
              price: product.price,
              weight: product.weight,
            ),
          ),

          productInCart
              ? ChangeQuantity(
                  pressOnIncreaseProductButton: () => model.pressOnIncreaseProductButton(product),
                  pressOnDecreaseProductButton: () => model.pressOnDecreaseProductButton(product),
                  productQuantity: model.getQuantityProduct(product),
                )
              : IconButton(
                  onPressed: () => model.pressOnIncreaseProductButton(product),
                  icon: const Icon(Icons.add, color: Colors.black),
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
