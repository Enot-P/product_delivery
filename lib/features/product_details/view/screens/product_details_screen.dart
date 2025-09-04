import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tea_delivery/app/repositories/cart_repository.dart';
import 'package:tea_delivery/features/features.dart';
import 'package:tea_delivery/features/product_details/view/widgets/product_details_body_widget.dart';
import 'package:tea_delivery/resources/resources.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailsViewModel(
        productId: id,
        cartRepository: GetIt.I<CartRepository>(),
      ),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            _AppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ProductBodyDetailsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

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
