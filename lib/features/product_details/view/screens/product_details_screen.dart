import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tea_delivery/resources/resources.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderDescriptionWidget(),
                  SizedBox(height: 16),
                  _BodyDescriptionWidget(),
                  SizedBox(height: 16),
                  _QuantityWidget(),
                  SizedBox(height: 16),
                  _AddToCartButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Действие для кнопки
        },
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
  const _QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Колличество',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {},
            ),
            Text(
              '3',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _BodyDescriptionWidget extends StatelessWidget {
  const _BodyDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world\'s finest lemon for juicing more',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green[50],
      expandedHeight: 250,
      flexibleSpace: PageView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return Image.asset(
            Images.teaExample,
            fit: BoxFit.cover,
            alignment: const Alignment(0, 0.3),
          );
        },
      ),
    );
  }
}

class _HeaderDescriptionWidget extends StatelessWidget {
  const _HeaderDescriptionWidget({super.key});

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
              '\$2.22',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Organic Lemons',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),

        // Рейтинг
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const Icon(Icons.star_half, color: Colors.amber, size: 16),
            const SizedBox(width: 8),
            Text(
              '4.5 ★ (99 reviews)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Вес
        Text(
          '1.50 lbs',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
