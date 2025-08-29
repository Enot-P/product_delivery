import 'package:tea_delivery/app/app.dart';

class CartItemEntity {
  final ProductEntity product;
  int quantity;

  CartItemEntity({
    required this.product,
    required this.quantity,
  });

  @override
  String toString() {
    return 'CartItemEntity(product: $product, quantity: $quantity)';
  }
}
