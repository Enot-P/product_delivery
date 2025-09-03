import 'dart:async';

import 'package:talker/talker.dart';
import 'package:tea_delivery/app/entity/entity.dart';

class CartRepository {
  final List<CartItemEntity> _cartItems = [];
  List<CartItemEntity> get cartItems => List.unmodifiable(_cartItems);

  final StreamController<List<CartItemEntity>> _streamController = StreamController<List<CartItemEntity>>();
  Stream<List<CartItemEntity>> get cartItemsStream => _streamController.stream;

  void removeProductByProduct(ProductEntity product) {
    _cartItems.removeWhere((item) => item.product == product);
    _streamController.add(_cartItems);
  }

  void removeProductByIndex(int index) {
    _cartItems.removeAt(index);
  }

  void addProduct(ProductEntity product) {
    _cartItems.add(CartItemEntity(product: product, quantity: 1));
    _streamController.add(cartItems);
    Talker().debug(_cartItems);
  }

  bool checkProduct(ProductEntity product) => _cartItems.any((item) => item.product == product);

  void increaseProductQuantity(ProductEntity product) {
    final indexProductInCart = _cartItems.indexWhere((item) => item.product == product);

    if (indexProductInCart >= 0) {
      _cartItems[indexProductInCart].quantity += 1;
      _streamController.add(cartItems);
    } else {
      throw 'Товара нету в корзине';
    }
  }

  void decreaseProductQuantity(ProductEntity product) {
    final indexProductInCart = _cartItems.indexWhere((item) => item.product == product);
    if (indexProductInCart == -1) throw 'Товара нету в корзине';

    if (_cartItems[indexProductInCart].quantity > 1) {
      _cartItems[indexProductInCart].quantity -= 1;
    } else {
      removeProductByIndex(indexProductInCart);
    }
    _streamController.add(cartItems);
  }
}
