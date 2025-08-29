import 'package:tea_delivery/app/entity/entity.dart';

class CartRepository {
  List<CartItemEntity> _cartItems = [];
  List<CartItemEntity> get cartItems => _cartItems;

  void increaseProductQuantity(ProductEntity product) {
    final indexProductInCart = _cartItems.indexWhere((item) => item.product == product);
    if (indexProductInCart >= 0) {
      _cartItems[indexProductInCart].quantity += 1;
    } else {
      _cartItems.add(CartItemEntity(product: product, quantity: 1));
    }
  }

  void decreaseProductQuantity(ProductEntity product) {
    final indexProductInCart = _cartItems.indexWhere((item) => item.product == product);
    if (indexProductInCart == -1) return;

    if (_cartItems[indexProductInCart].quantity > 1) {
      _cartItems[indexProductInCart].quantity -= 1;
    } else {
      _cartItems.removeAt(indexProductInCart);
    }
  }
}
