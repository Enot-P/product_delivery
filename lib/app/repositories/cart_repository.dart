import 'dart:async';

import 'package:talker/talker.dart';
import 'package:tea_delivery/app/entity/entity.dart';

class CartRepository {
  final List<CartItemEntity> _cartItems = [];
  List<CartItemEntity> get cartItems => List.unmodifiable(_cartItems);

  int _finalPrice = 0;
  int get finalPrice => getFinalPrice();

  final StreamController<List<CartItemEntity>> _streamController = StreamController<List<CartItemEntity>>();
  Stream<List<CartItemEntity>> get cartItemsStream => _streamController.stream;

  int getFinalPrice() {
    _finalPrice = cartItems.fold(0, (prevValue, cart) => prevValue + cart.product.price * cart.quantity);
    return _finalPrice;
  }

  int? getQuantityProduct(ProductEntity product) {
    final indexProductInCart = getProductIndexInCart(product);
    if (indexProductInCart == -1) return null;

    return cartItems[indexProductInCart].quantity;
  }

  void removeProductByProduct(ProductEntity product) {
    _cartItems.removeWhere((item) => item.product == product);
    _streamController.add(_cartItems);
  }

  void addProduct(ProductEntity product) {
    _cartItems.add(CartItemEntity(product: product, quantity: 1));
  }

  void increaseProductQuantity(ProductEntity product) {
    final indexProductInCart = getProductIndexInCart(product);

    if (indexProductInCart == -1) {
      addProduct(product);
    } else {
      if (indexProductInCart >= 0) {
        _cartItems[indexProductInCart].quantity += 1;
      } else {
        throw 'Товара нету в корзине';
      }
    }

    _streamController.add(cartItems);
    Talker().debug(_cartItems);
  }

  void decreaseProductQuantity(ProductEntity product) {
    final indexProductInCart = getProductIndexInCart(product);
    if (indexProductInCart == -1) throw 'Товара нету в корзине';

    if (_cartItems[indexProductInCart].quantity > 1) {
      _cartItems[indexProductInCart].quantity -= 1;
    } else {
      _cartItems.removeAt(indexProductInCart);
    }
    _streamController.add(cartItems);

    Talker().debug(_cartItems);
  }

  int getProductIndexInCart(ProductEntity product) =>
      _cartItems.indexWhere((item) => item.product.name == product.name);
  bool checkProductInCart(ProductEntity product) => _cartItems.any((item) => item.product.name == product.name);
}
