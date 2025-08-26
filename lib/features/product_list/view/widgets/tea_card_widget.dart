import 'package:flutter/material.dart';
import 'package:tea_delivery/app/domain/tea_entity.dart';
import 'package:tea_delivery/resources/resources.dart';

class TeaCardWidget extends StatelessWidget {
  const TeaCardWidget({super.key, required this.tea});
  final TeaEntity tea;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(image: tea.image),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: _ProductDescription(tea: tea),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black45,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    'В корзину',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 150;
    const double imageRadius = 15;
    return ClipRRect(
      borderRadius: const BorderRadiusGeometry.directional(
        topStart: Radius.circular(imageRadius),
        topEnd: Radius.circular(imageRadius),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          image,
          height: imageHeight,
          fit: BoxFit.cover,
          alignment: const Alignment(0, 0.5),
        ),
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({
    super.key,
    required this.tea,
  });

  final TeaEntity tea;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tea.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tea.weight,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            Text(
              '${tea.price.toString()}₽',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
